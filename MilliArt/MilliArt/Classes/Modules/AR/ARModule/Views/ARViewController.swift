//
//  ARViewController.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 31.10.2021.
//  
//

import UIKit
import SceneKit
import ARKit

final class ARViewController: UIViewController {
    
	private let output: ARViewOutput
    internal var sceneView = ARSCNView()
    internal var scanningLabel = UILabel()
    internal var foundLabel = UILabel()
    internal var magicButton = UIButton()
    private var arModel: PaintingARModel?
    private var touchDifference = SCNVector3()
    
    init(output: ARViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        self.output.viewDidLoad()
        [sceneView, scanningLabel, foundLabel, magicButton].forEach ({ [weak self] in self?.view.addSubview($0)
        })
        
        setUp()
	}
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addConstraintsAR()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .vertical
        
        sceneView.session.run(configuration)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scanningLabel.layer.cornerRadius = scanningLabel.frame.height / 2
        foundLabel.layer.cornerRadius = scanningLabel.frame.height / 2
    }
    
    private func setUp() {
        scanningLabel.layer.masksToBounds = true
        scanningLabel.backgroundColor = .gray.withAlphaComponent(0.4)
        scanningLabel.alpha = 0
        scanningLabel.text = "Поиск стены"
        animateFlash(label: scanningLabel)
        foundLabel.layer.masksToBounds = true
        foundLabel.text = "Стена найдена"
        foundLabel.isHidden = true
        foundLabel.backgroundColor = .gray.withAlphaComponent(0.4)
        foundLabel.textAlignment = .center
        scanningLabel.textAlignment = .center
        
        sceneView.delegate = self
        sceneView.autoenablesDefaultLighting = true
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        self.magicButton.setImage(UIImage(named: "magic"), for: .normal)
        self.magicButton.addTarget(self, action: #selector(openEditFrame), for: .touchUpInside)
        registerGestureRecognizers()
    }
    @objc
    func openEditFrame() {
        output.openEditFrame()
        sceneView.session.pause()
    }
        
    func animateFlash(label: UILabel) {
        UIView.animate(withDuration: 0.8, delay: 0, options: [.repeat, .autoreverse], animations: {
            label.alpha = CGFloat(1)
        }, completion: nil)
    }
    
    func animatefadeOut(label: UILabel) {
        UIView.animate(withDuration: 1, delay: 0.6, options: [], animations: {
            label.alpha = CGFloat(0)
        }, completion: nil)
    }
    
    func registerGestureRecognizers() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.sceneView.addGestureRecognizer(tapGestureRecognizer)
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        self.sceneView.addGestureRecognizer(panGestureRecognizer)
        
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture))
        self.sceneView.addGestureRecognizer(longPressGestureRecognizer)
    }
    
    @objc
    func handleTapGesture(recognizer: UITapGestureRecognizer) {
        let touchPosition = recognizer.location(in: sceneView)
        let hitTestResults = sceneView.hitTest(touchPosition, types: .existingPlaneUsingExtent)
        guard let hitTest = hitTestResults.first else {
            return
        }
        hangPicture(atLocation: hitTest)
    }
    
    func hangPicture(atLocation hitResult: ARHitTestResult) {
        let pictureNode = createPicture()
        
        let frameDepth:CGFloat = 0.03
        let frameNode = createFrame(depth: CGFloat(frameDepth))
        
        guard let hitResultAnchor = hitResult.anchor else {return}
        frameNode.transform = SCNMatrix4(hitResultAnchor.transform)
        frameNode.name = "frame"
        frameNode.eulerAngles = SCNVector3(frameNode.eulerAngles.x + (-Float.pi / 2), frameNode.eulerAngles.y, frameNode.eulerAngles.z)
        
        let location = hitResult.worldTransform.columns.3
        frameNode.position = SCNVector3(
            x: location.x,
            y: location.y,
            z: location.z + Float(frameDepth/2)
        )
        
        frameNode.addChildNode(pictureNode)
        
        pictureNode.position = SCNVector3(
            x: 0,
            y: 0,
            z: Float(frameDepth/2)+0.001)
        
        sceneView.scene.rootNode.addChildNode(frameNode.flattenedClone())
    }
    
    func createFrame(depth frameDepth: CGFloat) -> SCNNode {
        guard let arModel = self.arModel else { return SCNNode() }
        let frameBox = SCNBox(width: CGFloat(arModel.width / 100), height: CGFloat(arModel.height / 100), length: frameDepth, chamferRadius: 0.001)
        frameBox.firstMaterial?.diffuse.contents = UIImage(named: "art.scnassets/\(arModel.material)Color.jpg")
        frameBox.firstMaterial?.normal.contents = UIImage(named: "art.scnassets/\(arModel.material)Normal.jpg")
        frameBox.firstMaterial?.roughness.contents = UIImage(named: "art.scnassets/\(arModel.material)Roughness.jpg")
        //if frame.material == "Gold" || frame.material == "Silver" {
            frameBox.firstMaterial?.lightingModel = .physicallyBased
            frameBox.firstMaterial?.metalness.contents = UIColor(white: 0.7, alpha: 1.0)
            frameBox.firstMaterial?.shininess = 100
      //  }
        return SCNNode(geometry: frameBox)
    }
    
    func createPicture() -> SCNNode {
        let pictureHeight:CGFloat = CGFloat(arModel!.height - 10)
        let pictureWidth:CGFloat =  CGFloat(arModel!.width - 10)
        let picture = SCNPlane(width: CGFloat(pictureWidth / 100), height: CGFloat(pictureHeight / 100))
        picture.firstMaterial?.diffuse.contents = UIImage(named: (arModel?.pic)!)
        picture.firstMaterial?.lightingModel = .blinn
        picture.firstMaterial?.specular.contents = UIColor(white: 0.6, alpha: 1.0)
        picture.firstMaterial?.shininess = 100
        return SCNNode(geometry: picture)
    }
    
    
    @objc
    func handleLongPressGesture(recognizer: UILongPressGestureRecognizer) {
        let touchLocation = recognizer.location(in: recognizer.view)
        
        let hitTestResults = self.sceneView.hitTest(touchLocation, options: nil)
        if let tappedNode = hitTestResults.first?.node {
            AudioServicesPlaySystemSound(1520)
            tappedNode.removeFromParentNode()
        }
    }
    
    @objc
    func handlePanGesture(recognizer: UIPanGestureRecognizer) {
        let touchLocation = recognizer.location(in: recognizer.view)
        
        guard let query = sceneView.raycastQuery(from: touchLocation, allowing: .existingPlaneInfinite, alignment: .vertical) else {return}
        let results = sceneView.session.raycast(query)
        guard let result = results.first else {return}

        let hitTestResults = self.sceneView.hitTest(touchLocation, options: nil)
        if let tappedNode = hitTestResults.first?.node {
            if recognizer.state == .began {
                touchDifference = SCNVector3Make(result.worldTransform.columns.3.x - tappedNode.position.x,
                                                 result.worldTransform.columns.3.y - tappedNode.position.y,
                                                 tappedNode.position.z)
            }
            let newPosition = SCNVector3Make(result.worldTransform.columns.3.x - touchDifference.x,
                                             result.worldTransform.columns.3.y - touchDifference.y,
                                             tappedNode.position.z)
            tappedNode.position = newPosition
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
        sceneView.session.pause()
    }
}

extension ARViewController: ARSCNViewDelegate {

    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        DispatchQueue.main.async {
            self.scanningLabel.removeFromSuperview()
            self.foundLabel.isHidden = false
            self.foundLabel.alpha = 1
            self.animatefadeOut(label: self.foundLabel)
        }
        guard let planeAnchor = anchor as? ARPlaneAnchor else {return}
        let planeNode = createPlane(withPlaneAnchor: planeAnchor)
        node.addChildNode(planeNode)
    }

    func createPlane(withPlaneAnchor planeAnchor: ARPlaneAnchor) -> SCNNode {
        let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
        let planeNode = SCNNode()
        planeNode.isHidden = true
        planeNode.position = SCNVector3(x: planeAnchor.center.x, y: 0, z: planeAnchor.center.z)
        planeNode.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)
        planeNode.geometry = plane
        return planeNode
    }
}

extension ARViewController: ARViewInput {
    func loadModel(arModel: PaintingARModel?) {
        self.arModel = arModel
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .vertical
        
        sceneView.session.run(configuration)
        guard let arModel = self.arModel else { return }
        sceneView.scene.rootNode.childNodes.forEach { node in
            if node.name == "frame" {
                node.geometry?.materials.last?.diffuse.contents = UIImage(named: "art.scnassets/\(arModel.material)Color.jpg")
                node.geometry?.materials.last?.normal.contents = UIImage(named: "art.scnassets/\(arModel.material)Normal.jpg")
                node.geometry?.materials.last?.roughness.contents = UIImage(named: "art.scnassets/\(arModel.material)Roughness.jpg")
            }
        }
    }
}



