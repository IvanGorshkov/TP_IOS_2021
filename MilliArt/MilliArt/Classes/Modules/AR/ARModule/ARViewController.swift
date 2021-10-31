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
    private var arModel: PaintingARModel?
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
        [sceneView, scanningLabel, foundLabel].forEach ({ [weak self] in self?.view.addSubview($0)
        })
        
        setUp()
        
        self.scanningLabel.translatesAutoresizingMaskIntoConstraints = false
        self.scanningLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.scanningLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        self.scanningLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.scanningLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
	}
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.sceneView.translatesAutoresizingMaskIntoConstraints = false
        self.sceneView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.sceneView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.sceneView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.sceneView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        self.foundLabel.translatesAutoresizingMaskIntoConstraints = false
        self.foundLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.foundLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        self.foundLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.foundLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
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
        registerGestureRecognizers()
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
      //  let touchLocation = recognizer.location(in: recognizer.view)
        
    //    let hitTestResults = self.sceneView.hitTest(touchLocation, options: nil)
      //  if hitTestResults.first?.node != nil {
        //    return
        //}
        
        
        let touchPosition = recognizer.location(in: sceneView)
        let hitTestResults = sceneView.hitTest(touchPosition, types: .existingPlaneUsingExtent)
        guard hitTestResults.first == nil else {
                return
            }
        
        guard let query = sceneView.raycastQuery(from: touchPosition, allowing: .existingPlaneInfinite, alignment: .vertical) else {return}
        let results = sceneView.session.raycast(query)
        if let result = results.first {
            hangPicture(atLocation: result)
        }
    }
    
    func hangPicture(atLocation hitResult: ARRaycastResult) {
        let pictureNode = createPicture()
        
        let frameDepth:CGFloat = 0.03
        let frameNode = createFrame(depth: CGFloat(frameDepth))
        
        guard let hitResultAnchor = hitResult.anchor else {return}
        frameNode.transform = SCNMatrix4(hitResultAnchor.transform)
        frameNode.eulerAngles.x -= (.pi / 2)
        
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
        let frameBox = SCNBox(width: CGFloat(CGFloat(arModel!.width) / 100), height: CGFloat(CGFloat(arModel!.height) / 100), length: frameDepth, chamferRadius: 0.001)
        frameBox.firstMaterial?.diffuse.contents = UIImage(named: "art.scnassets/GoldColor.jpg")
        frameBox.firstMaterial?.normal.contents = UIImage(named: "art.scnassets/GoldNormal.jpg")
        frameBox.firstMaterial?.roughness.contents = UIImage(named: "art.scnassets/GoldRoughness.jpg")
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
    }
    
    @objc
    func handlePanGesture(recognizer: UIPanGestureRecognizer) {
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
    }
}
