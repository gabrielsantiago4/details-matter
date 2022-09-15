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



enum Scenario: Int, CaseIterable{
    case dry = 0
    case dry1 = 1
    case wet1 = 2
    case wet2 = 3
    case wet3 = 4
    
    var nodes: [SCNNode]{
        switch self{
        case .dry:
            return [LakeView.dryScenario]
        case .dry1:
            return [LakeView.dry1Scenario, LakeView.water1Scenario]
        case .wet1:
            return [LakeView.wet1Scenario, LakeView.water2Scenario]
        case .wet2:
          
            return [LakeView.wet2Scenario, LakeView.water3Scenario,LakeView.nemo]
        case .wet3:
            return [LakeView.wet3Scenario, LakeView.water4Scenario,LakeView.nemo, LakeView.dori]
        }
            
    }
}



extension LakeView{
    
    
    
   static var waterMaterial:SCNMaterial{
        get{
            let material = SCNMaterial()
               material.diffuse.contents = UIColor.black
               material.reflective.contents = UIColor(red: 0, green: 0.764, blue: 1, alpha: 1)
               material.reflective.intensity = 2.7
               material.transparent.contents = UIColor.black.withAlphaComponent(0.3)
               material.transparencyMode = .dualLayer
               material.fresnelExponent = 3
            return material
        }
     
    }
    
  
    
    static var fishAnimationNemo: SCNAction{
        get{
            let moveZ = SCNAction.moveBy(x: 1, y: 0, z: 0, duration: 1)
            let rotateFirst = SCNAction.rotate(by: CGFloat(-180.toRadian()), around: SCNVector3(x: 0, y: 0.3, z: 0), duration: 2.3)
            let moveX = SCNAction.moveBy(x: -1, y: 0, z: 0, duration: 1)
            let rotateSecond = SCNAction.rotate(by: CGFloat(180.toRadian()), around: SCNVector3(x: 0, y: -0.3, z: 0), duration: 2.3)
            
            let moveSequence = SCNAction.sequence([moveZ,rotateFirst,moveX, rotateSecond])
            
            let moveLoop = SCNAction.repeatForever(moveSequence)
            return moveLoop
        }
    }
    
    static var fishAnimationDori: SCNAction{
        get{
            let moveZ = SCNAction.moveBy(x: 1, y: 0, z: 0, duration: 2.3)
            let rotateFirst = SCNAction.rotate(by: CGFloat(180.toRadian()), around: SCNVector3(x: 0, y: 0.3, z: 0), duration: 2.3)
            let moveX = SCNAction.moveBy(x: -1, y: 0, z: 0, duration: 2.3)
            let rotateSecond = SCNAction.rotate(by: CGFloat(-180.toRadian()), around: SCNVector3(x: 0, y: -0.3, z: 0), duration: 2.3)
            
            let moveSequence = SCNAction.sequence([moveX,rotateFirst,moveZ, rotateSecond])
            
            let moveLoop = SCNAction.repeatForever(moveSequence)
            return moveLoop
        }
    }
   
}
class LakeView: SCNView {
    

    static var dori: SCNNode = {
        
        let scene = SCNScene(named: "dori.dae")!
        let node = scene.rootNode.childNodes[0]
        node.scale = SCNVector3(x: 0.09, y: 0.09, z: 0.09)
        node.position = SCNVector3(x: 3.3, y: 3.15, z: -1)
        
        node.runAction(LakeView.fishAnimationDori)
        return node
    }()
    static var nemo: SCNNode = {
        
        let scene = SCNScene(named: "peixe1.dae")!
        let node = scene.rootNode.childNodes[0]
        node.scale = SCNVector3(x: 0.09, y: 0.09, z: 0.09)
        node.position = SCNVector3(x: 2, y: 2.40, z: -1)
        node.runAction(LakeView.fishAnimationNemo)
        return node
    }()
    
    static  var dryScenario: SCNNode = {
        let scene = SCNScene(named: "dry-0.dae")!
        let node = scene.rootNode.childNodes[0]
        return node
    }()
    
    static  var dry1Scenario: SCNNode = {
        let scene = SCNScene(named: "dry-1.dae")!
        let node = scene.rootNode.childNodes[0]
        return node
    }()
    
    static  var wet1Scenario: SCNNode = {
        let scene = SCNScene(named: "wet-1.dae")!
        let node = scene.rootNode.childNodes[0]
        return node
    }()
    
    static  var wet2Scenario: SCNNode = {
        let scene = SCNScene(named: "wet-2.dae")!
        let node = scene.rootNode.childNodes[0]
        return node
    }()
    
    static  var wet3Scenario: SCNNode = {
        let scene = SCNScene(named: "wet3.dae")!
        let node = scene.rootNode.childNodes[0]
        return node
    }()
    
    
    
    
    static  var water1Scenario: SCNNode = {
        let scene = SCNScene(named: "water1")!
        let node = scene.rootNode.childNodes[0]
        node.scale = SCNVector3(x: 0.999, y: 0.999, z: 0.999)
        node.geometry?.firstMaterial = LakeView.waterMaterial
        return node
    }()
    
    static  var water2Scenario: SCNNode = {
        let scene = SCNScene(named: "water2")!
        let node = scene.rootNode.childNodes[0]
        node.scale = SCNVector3(x: 0.999, y: 0.999, z: 0.999)
        node.geometry?.firstMaterial = LakeView.waterMaterial

        return node
    }()
    
    static  var water3Scenario: SCNNode = {
        
        let scene = SCNScene(named: "water3")!
        let node = scene.rootNode.childNodes[0]
        node.scale = SCNVector3(x: 0.999, y: 0.999, z: 0.999)
        node.rotation = SCNVector4(0, 1, 0, 360.toRadian())
        node.position = SCNVector3(0, 0, 0)
        node.geometry?.firstMaterial = waterMaterial
     
        return node
    }()
    
    static  var water4Scenario: SCNNode = {
        
        let scene = SCNScene(named: "water4")!
        let node = scene.rootNode.childNodes[0]
        node.scale = SCNVector3(x: 0.999, y: 0.999, z: 0.999)
        node.rotation = SCNVector4(0, 1, 0, 360.toRadian())

        node.geometry?.firstMaterial = waterMaterial
     
        return node
    }()
    
    static var topLight: SCNNode = {
        let topLight = SCNNode()
        topLight.light = SCNLight()
        topLight.light?.type = .directional
        topLight.light?.castsShadow = true
        topLight.light?.shadowMode = .modulated
        topLight.light?.intensity = 1000
        
        
        topLight.position = SCNVector3(x: -0.2672454, y: 40.40103, z: -8.535366)
        topLight.rotation = SCNVector4(x: -0.99604034, y: 0.07114126, z: 0.05331763, w: 1.2901226)
        topLight.eulerAngles =  SCNVector3(x: -1.2863125, y: 0.106957085, z: 1.4986801e-08)
        
        return topLight
    }()
    
    static var ambientLight: SCNNode = {
        let ambiente = SCNNode()
        ambiente.light = SCNLight()
        ambiente.light?.type = .ambient
        ambiente.light?.castsShadow = true
        ambiente.light?.intensity = 500
        

        ambiente.position = SCNVector3(x: -0.2672454, y: 40.40103, z: -8.535366)
        ambiente.rotation = SCNVector4(x: -0.99604034, y: 0.07114126, z: 0.05331763, w: 1.2901226)
        ambiente.eulerAngles =  SCNVector3(x: -1.2863125, y: 0.106957085, z: 1.4986801e-08)
        return ambiente
    }()
    
   
    static var cameraNode: SCNNode = {
        let cameraNode = SCNNode()
        let camera = SCNCamera()// the camera
        camera.usesOrthographicProjection = true
        camera.orthographicScale = 3.7

        cameraNode.camera = camera
    
        
        cameraNode.position = SCNVector3(x: -0.18155792, y: 4.0028123, z: 0.537899)
        cameraNode.rotation = SCNVector4(x: -0.9986019, y: -0.05200568, z: -0.009337218, w: 0.3557861)
        cameraNode.eulerAngles = SCNVector3(x: -0.35529917, y: -0.018700039, z: 4.657428e-10)
        
        return cameraNode
    }()
    
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    func loadScene(tipo:Scenario){
        let scene = MyScene()

        scene.rootNode.addChildNode(LakeView.topLight)
        
        tipo.nodes.forEach { node in
            scene.rootNode.addChildNode(node)
        }
        
        scene.rootNode.addChildNode(LakeView.ambientLight)
        
        scene.rootNode.position = SCNVector3Make(-2.8, -3, -10)
        scene.rootNode.eulerAngles = SCNVector3(0.toRadian(), 320.toRadian(),0.toRadian())
        
        self.scene = scene
        
        config()

    }
    
    func config(){
        self.showsStatistics = false
        self.backgroundColor = .clear
        self.allowsCameraControl = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.defaultCameraController.maximumHorizontalAngle = 90
        self.defaultCameraController.minimumHorizontalAngle = -90
        self.defaultCameraController.maximumVerticalAngle = 30
        self.defaultCameraController.minimumVerticalAngle = 0
        self.translatesAutoresizingMaskIntoConstraints = false
        self.pointOfView = LakeView.cameraNode
    }
    
    
    init() {
        super.init(frame: .zero, options: [:])
        
        //self.delegate = scene
        
        loadScene(tipo: .dry)
    
      
    
    }

}



