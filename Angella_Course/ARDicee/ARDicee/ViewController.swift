//
//  ViewController.swift
//  ARDicee
//
//  Created by PavelM on 19/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
  
  var diceArray:[SCNNode] = []
  
  @IBOutlet var sceneView: ARSCNView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
    
    // Set the view's delegate
    sceneView.delegate = self
    
    // Show statistics such as fps and timing information
    sceneView.showsStatistics = true
    
    //////////////  Добавим сферу
    
//    let sphere = SCNSphere(radius: 0.2)
//    let material = SCNMaterial()
//    material.diffuse.contents = UIImage(named: "art.scnassets/8k_moon.jpg")
//    sphere.materials = [material]
//
//        let node = SCNNode()
//        node.position = SCNVector3(0, 0.1, -0.5)
//        node.geometry = sphere
    
    /////////// Добавим свой куб!
    
//    let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
//
//    let material = SCNMaterial()
//    material.diffuse.contents = UIColor.red
//    cube.materials = [material]
//
//    let node = SCNNode()
//    node.position = SCNVector3(0, 0.1, -0.5)
//    node.geometry = cube
//
    
//    sceneView.scene.rootNode.addChildNode(node)
//    sceneView.autoenablesDefaultLighting = true
    
   
    
    
    
    ////// Подгрузим готовую сцену самолетика
//    // Create a new scene
//    let scene = SCNScene(named: "art.scnassets/ship.scn")!
//
//    // Set the scene to the view
//    sceneView.scene = scene
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // этот объект отвечает за перемещение элемента в пространстве!
    // World Configuration работает тольео на новыйх чипах! iphone6
    // configuration = AROrientationTrackingConfiguration()
    
    // Create a session configuration

    if ARWorldTrackingConfiguration.isSupported {
      print("true")
      let configuration = ARWorldTrackingConfiguration()
      configuration.planeDetection = .horizontal
      
      sceneView.session.run(configuration)
      
    } else {
      print("false")
      let configuration = AROrientationTrackingConfiguration()
      sceneView.session.run(configuration)
    }
    
    
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    // Pause the view's session
    sceneView.session.pause()
  }
  
  
  // MARK: Dice Rendering Method
  
  // Взаимодействуем c пользователем
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    if let touch = touches.first {
      let touchLocation = touch.location(in: sceneView)
      
      let results = sceneView.hitTest(touchLocation, types: .existingPlaneUsingExtent)
      
      if let hitResult = results.first {
        
        addDice(atLocation: hitResult)
      }
      
    }
  }
  
  func addDice(atLocation location: ARHitTestResult) {
    /// Добавим кубики
    let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!
    
    if let diceNode = diceScene.rootNode.childNode(withName: "Dice", recursively: true) {
      
      diceNode.position = SCNVector3(
        x: location.worldTransform.columns.3.x,
        y: location.worldTransform.columns.3.y + diceNode.boundingSphere.radius,
        z: location.worldTransform.columns.3.z)
      
      diceArray.append(diceNode)
      
      // Set the scene to the view
      sceneView.scene.rootNode.addChildNode(diceNode)
      
      roll(dice: diceNode)
    }
  }
  
  
  // Удаляем обеъкты со сцены
  @IBAction func removeAllDicee(_ sender: UIBarButtonItem) {
    if !diceArray.isEmpty {
      for dice in diceArray {
        dice.removeFromParentNode()
      }
    }
  }
  // кнопка или встряска
  @IBAction func rollAgain(_ sender: UIBarButtonItem) {
    rollAll()
  }
  override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    rollAll()
  }
  
  func rollAll() {
    if !diceArray.isEmpty {
      for dice in diceArray {
        roll(dice:dice)
      }
    }
  }
  
  func roll(dice: SCNNode) {
    
    let randomX = Float((Int.random(in: 0...4) + 1)) * (Float.pi / 2)
    let randomZ = Float((Int.random(in: 0...4) + 1)) * (Float.pi / 2)
    
    dice.runAction(
      SCNAction.rotateBy(
        x: CGFloat(randomX * 5),
        y: 0,
        z: CGFloat(randomZ * 5),
        duration: 0.5))
  }
  
  // MARK: - ARSCNViewDelegateMethod
  
  // Чекаем  и размещаем Горизонтальную поверхность
  func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
    
    guard let planeAnchor = anchor as? ARPlaneAnchor else {return}
    let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
    
    let planeNode = SCNNode()
    planeNode.position = SCNVector3(x: planeAnchor.center.x, y: 0, z: planeAnchor.center.z)
    planeNode.transform = SCNMatrix4MakeRotation(-Float.pi / 2, 1, 0, 0)
    
    let gridMaterial = SCNMaterial()
    gridMaterial.diffuse.contents = UIImage(named: "art.scnassets/grid.png")
    
    plane.materials = [gridMaterial]
    planeNode.geometry = plane
    
    node.addChildNode(planeNode)

  }
}



