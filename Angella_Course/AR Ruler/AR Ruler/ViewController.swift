//
//  ViewController.swift
//  AR Ruler
//
//  Created by PavelM on 20/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
  
  @IBOutlet var sceneView: ARSCNView!
  
  // Массив ссылок на объекты расположенные в пространстве
  var dotNodes = [SCNNode]()
  var textNode = SCNNode()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Set the view's delegate
    sceneView.delegate = self
    sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
    
    // Show statistics such as fps and timing information
    sceneView.showsStatistics = true
    
    // Create a new scene
    let scene = SCNScene(named: "art.scnassets/ship.scn")!
    
    // Set the scene to the view
    sceneView.scene = scene
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // Create a session configuration
    let configuration = ARWorldTrackingConfiguration()
    
    // Run the view's session
    sceneView.session.run(configuration)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    // Pause the view's session
    sceneView.session.pause()
  }
  
  
  
}

// MARK: ARDelegateMethods

extension ViewController {
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    if dotNodes.count >= 2 {
      
      for dot in dotNodes {
        dot.removeFromParentNode()
      }
      
      dotNodes = [SCNNode]()
    }
    if let touchLocation = touches.first?.location(in: sceneView) {
      
      let hitTestResult = sceneView.hitTest(touchLocation, types: .featurePoint)
      
      if let hitResult = hitTestResult.first {
        addDot(at: hitResult)
      }
      
    }
  }
  
  // Задача создать сферу
  func addDot(at result: ARHitTestResult) {
    // Сначала создаем объект
    let sphere = SCNSphere(radius: 0.005)
    // Потом делаем материализацию
    let material = SCNMaterial()
    material.diffuse.contents = UIColor.red
    sphere.materials = [material]
    
    // Ссылка на объект
    let dotNode = SCNNode(geometry: sphere)
    
    // Поместить в пространстве
    dotNode.position = SCNVector3(x: result.worldTransform.columns.3.x, y: result.worldTransform.columns.3.y, z: result.worldTransform.columns.3.z)
    
    sceneView.scene.rootNode.addChildNode(dotNode)
    dotNodes.append(dotNode)
    
    if dotNodes.count >= 2 {
      calculate()
    }
    
  }
  
  func calculate() {
    
    let start = dotNodes[0]
    let end = dotNodes[1]
    
    print(start)
    print(end)
    
    let a = end.position.x - start.position.x
    let b = end.position.y - start.position.y
    let c = end.position.z - start.position.z
    
    let distance = sqrt(
      pow(a,2) +
      pow(b,2) +
      pow(c,2)
    )
    
    print(Int(distance * 100))
    
    updateText(text: "\(abs(distance)) cm.", atPosition: end.position)
  }
  
  func updateText(text: String, atPosition position: SCNVector3) {
    
    // Если уже был отображен текст то он удалится
    textNode.removeFromParentNode()
    
    let textGeometry = SCNText(string: text, extrusionDepth: 1.0)
    textGeometry.firstMaterial?.diffuse.contents = UIColor.white
    
    
    textNode = SCNNode(geometry: textGeometry)
    textNode.position = SCNVector3(x: position.x, y: position.y + 0.01, z: position.z)
    
    textNode.scale = SCNVector3(x: 0.01, y: 0.01, z: 0.01)
    
    sceneView.scene.rootNode.addChildNode(textNode)
  }
  
}
