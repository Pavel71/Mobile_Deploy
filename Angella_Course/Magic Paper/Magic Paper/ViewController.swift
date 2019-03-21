//
//  ViewController.swift
//  Magic Paper
//
//  Created by PavelM on 21/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

// 1. Задача стоит увидеть картинку!
// 2. После того как чекнули картинку запустить видео

class ViewController: UIViewController {
  
  @IBOutlet var sceneView: ARSCNView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Set the view's delegate
    sceneView.delegate = self
    
    // Show statistics such as fps and timing information
    sceneView.showsStatistics = true
    
 
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // 1. Настроить конфигурацию на поиск картинок!
    
    // Create a session configuration
    let configuration = ARImageTrackingConfiguration()
    
    // Если нашли наши картинки
    if let imageToTrack = ARReferenceImage.referenceImages(inGroupNamed: "NewsPaperImages", bundle: Bundle.main) {
      
      // Отслеживаем картинки
      configuration.trackingImages = imageToTrack
      configuration.maximumNumberOfTrackedImages = 1
      
      print("Images Successfully Added")
    }
    
    // Run the view's session
    sceneView.session.run(configuration)
  }
  
  
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    // Pause the view's session
    sceneView.session.pause()
  }
  
  
}

extension ViewController: ARSCNViewDelegate {
  
  // этот метод отвечает за детекирование знакомых поверхностей
  func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
    
    let node = SCNNode()
    // Если мы засекли картнку которую добавили при загрузке Котроллера
    if let imageAnchor = anchor as? ARImageAnchor {
      
      let videoNode = SKVideoNode()
      videoNode.play()
      
      let videoScene = SKScene(size: CGSize(width: 480, height: 360))
      
      // Разместить по середине сцены
      videoNode.position = CGPoint(
        x: videoScene.size.width / 2,
        y: videoScene.size.height / 2)
      
      videoNode.yScale = -1.0
      
      videoScene.addChild(videoNode)
      
      // Создадим площадку которая ляжет поверх картинки Plane
      let plane = SCNPlane(
        width: imageAnchor.referenceImage.physicalSize.width,
        height: imageAnchor.referenceImage.physicalSize.height)
      
      // UIColor(white: 1.0, alpha: 0.5)
      plane.firstMaterial?.diffuse.contents = videoScene
      let planeNode = SCNNode(geometry: plane)
      planeNode.eulerAngles.x = -.pi / 2
      node.addChildNode(planeNode)
      
      // Создадим запуск видео по этой площадке
      
      let nameImage = imageAnchor.referenceImage.name // имя видео тоже и размер такойже
      
    }
    
    return node
  }
  
}
