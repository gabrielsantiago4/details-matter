//
//  lakeViewViewController.swift
//  DayLight Teste
//
//  Created by João Victor Ipirajá de Alencar on 13/09/22.
//

import UIKit
import SceneKit

extension Int{
    func toRadian() -> Float{
        return Float(self) * Float.pi/180
    }
}


class MyScene: SCNScene, SCNSceneRendererDelegate {
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        
        print("\n\nroot")
        print(self.rootNode.position)
        print(self.rootNode.rotation)
        print(self.rootNode.eulerAngles)
        print(self.rootNode.scale)
        print(self.rootNode.simdEulerAngles)
        
        print("peixe")
        
        
        print(self.rootNode.childNodes[2].position)

        
        print("cam")
        print(renderer.pointOfView!.position)
        print(renderer.pointOfView!.rotation)
        print(renderer.pointOfView!.eulerAngles)
        print(renderer.pointOfView!.simdEulerAngles)
        print(renderer.pointOfView!.scale)
    }
    
}


extension LakeView{
   
}
class LakeView: SCNView {
    

    lazy var peixe: SCNNode = {
        
        let scene = SCNScene(named: "peixe1.dae")!
        let node = scene.rootNode.childNodes[0]
        
        node.scale = SCNVector3(x: 0.2, y: 0.2, z: 0.2)
        node.position = SCNVector3(x: 2, y: 2, z: -1)
        
        
        let moveZ = SCNAction.moveBy(x: 1, y: 0, z: 0, duration: 1)
        let rotateFirst = SCNAction.rotate(by: CGFloat(-180.toRadian()), around: SCNVector3(x: 0, y: 0.3, z: 0), duration: 2.3)
        let moveX = SCNAction.moveBy(x: -1, y: 0, z: 0, duration: 1)
        let rotateSecond = SCNAction.rotate(by: CGFloat(180.toRadian()), around: SCNVector3(x: 0, y: -0.3, z: 0), duration: 2.3)
        
        let moveSequence = SCNAction.sequence([moveZ,rotateFirst,moveX, rotateSecond])
        
        let moveLoop = SCNAction.repeatForever(moveSequence)
        node.runAction(moveLoop)
        

        
        return node
    }()
    
    lazy var dryScenario: SCNNode = {
        let scene = SCNScene(named: "dry.dae")!
        let node = scene.rootNode.childNodes[0]
        return node
    }()
    
    lazy var dry1Scenario: SCNNode = {
        let scene = SCNScene(named: "dry-1.dae")!
        let node = scene.rootNode.childNodes[0]
        return node
    }()
    
    lazy var wet1Scenario: SCNNode = {
        let scene = SCNScene(named: "wet-1.dae")!
        let node = scene.rootNode.childNodes[0]
        return node
    }()
    
    lazy var wet2Scenario: SCNNode = {
        let scene = SCNScene(named: "wet-2.dae")!
        let node = scene.rootNode.childNodes[0]
        return node
    }()
    
    
    
    lazy var water1Scenario: SCNNode = {
        let scene = SCNScene(named: "water1")!
        let node = scene.rootNode.childNodes[0]
        node.geometry?.firstMaterial?.lightingModel =  .lambert
        return node
    }()
    
    lazy var water2Scenario: SCNNode = {
        let scene = SCNScene(named: "water2")!
        let node = scene.rootNode.childNodes[0]
        node.geometry?.firstMaterial?.lightingModel =  .lambert
        return node
    }()
    
    lazy var water3Scenario: SCNNode = {
        
        let material = SCNMaterial()
           material.diffuse.contents = UIColor.black
           material.reflective.contents = UIColor(red: 0, green: 0.764, blue: 1, alpha: 1)
           material.reflective.intensity = 2.7
           material.transparent.contents = UIColor.black.withAlphaComponent(0.3)
           material.transparencyMode = .dualLayer
           material.fresnelExponent = 3

        let scene = SCNScene(named: "water3")!
        let node = scene.rootNode.childNodes[0]
        node.scale = SCNVector3(x: 0.999, y: 0.999, z: 0.999)

        node.geometry?.firstMaterial = material
     
        return node
    }()
    
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero, options: [:])
        
        let scene = MyScene()
        //self.delegate = scene
        

        
        let topLight = SCNNode()
        topLight.light = SCNLight()
        topLight.light?.type = .directional
        topLight.light?.castsShadow = true
        topLight.light?.shadowMode = .modulated
//        topLight.light?.color = UIColor.blue
        topLight.light?.intensity = 1000
        
        
        let ambiente = SCNNode()
        ambiente.light = SCNLight()
        ambiente.light?.type = .ambient
        ambiente.light?.castsShadow = true
        ambiente.light?.intensity = 500
        
        

//        peixe.position = SCNVector3(x: -2.8, y: -3.0, z: -10.0)
//        peixe.rotation = SCNVector4(x: -0.0, y: 1.0, z: -0.0, w: 5.585053)
//        peixe.eulerAngles = SCNVector3(x: 0.0, y: 5.585053, z: 0.0)

      


        //-3.7 -1.7 Z
        // 2 O.3 X
        
        
    
        topLight.position = SCNVector3(x: -0.2672454, y: 40.40103, z: -8.535366)
        topLight.rotation = SCNVector4(x: -0.99604034, y: 0.07114126, z: 0.05331763, w: 1.2901226)
        topLight.eulerAngles =  SCNVector3(x: -1.2863125, y: 0.106957085, z: 1.4986801e-08)
        
        ambiente.position = SCNVector3(x: -0.2672454, y: 40.40103, z: -8.535366)
        ambiente.rotation = SCNVector4(x: -0.99604034, y: 0.07114126, z: 0.05331763, w: 1.2901226)
        ambiente.eulerAngles =  SCNVector3(x: -1.2863125, y: 0.106957085, z: 1.4986801e-08)

        
//        let leftLight = SCNNode()
//        leftLight.light = SCNLight()
//        leftLight.light?.type = .directional
//        leftLight.position = SCNVector3(x: 6.0469837, y: 5.114538, z: -3.513064)
//        leftLight.rotation = SCNVector4(x: -0.55586845, y: 0.803517, z: 0.21300259, w: 0.8899779)
//        leftLight.eulerAngles =  SCNVector3(x: -0.5182557, y: 0.7318611, z: 0.0)
        
        
       
        
        scene.rootNode.addChildNode(topLight)
        scene.rootNode.addChildNode(wet1Scenario)
        scene.rootNode.addChildNode(water3Scenario)
        scene.rootNode.addChildNode(peixe)
        //scene.rootNode.addChildNode(sphereNode)
        scene.rootNode.addChildNode(ambiente)
        
        
        scene.rootNode.position = SCNVector3Make(-2.8, -3, -10)
        scene.rootNode.eulerAngles = SCNVector3(0.toRadian(), 320.toRadian(),0.toRadian())
//        scene.rootNode.rotation.w = 10.toRadian()
//        print(scene.rootNode.rotation.w)
//        scene.rootNode.rotation.x += 50
        
        self.scene = scene



            
        self.showsStatistics = false
        self.allowsCameraControl = true
//        sceneView.cameraControlConfiguration.allowsTranslation = false
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.defaultCameraController.maximumHorizontalAngle = 90
        self.defaultCameraController.minimumHorizontalAngle = -90
        
        self.defaultCameraController.maximumVerticalAngle = 30
        self.defaultCameraController.minimumVerticalAngle = 0
                
        // sceneView.defaultCameraController.maximumVerticalAngle = 100.toRadian()
        
        self.autoenablesDefaultLighting = true
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let cameraNode = SCNNode()
        let camera = SCNCamera()// the camera
        camera.usesOrthographicProjection = true
        camera.orthographicScale = 2.2

        cameraNode.camera = camera
    
        
        //cameraNode.scale = SCNVector3(x: 6.1, y:6.1, z:6.1)
        cameraNode.position = SCNVector3(x: -0.18155792, y: 4.0028123, z: 0.537899)
        cameraNode.rotation = SCNVector4(x: -0.9986019, y: -0.05200568, z: -0.009337218, w: 0.3557861)
        cameraNode.eulerAngles = SCNVector3(x: -0.35529917, y: -0.018700039, z: 4.657428e-10)
    
//        cameraNode.eulerAngles = SCNVector3(0,-1.3*Float.pi,0)
        
        //scene.rootNode.addChildNode(cameraNode)
        self.pointOfView = cameraNode

        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(rec:)))

       
    
    }
    
    
    
        

  

}
