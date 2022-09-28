//
//  ViewController.swift
//  World Tracking
//
//  Created by Pedro Freddi on 28/09/22.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    // MARK: - IBOutlets
    
    @IBOutlet var sceneView: ARSCNView!
    
    // MARK: - Properties
    
    let configuration = ARWorldTrackingConfiguration()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [
            .showFeaturePoints,
            .showWorldOrigin
        ]
        self.sceneView.session.run(configuration)
    }
    
    // MARK: - Private
    
    private func getCoordinate() -> Float {
        return (Float.random(in: -0.9...0.9)*100).rounded() / 100
    }
    
    // MARK: - IBActions
    
    // After finish the tutorial I've decided to implement
    // a function to generate random coordinates.
    @IBAction func add(_ sender: Any) {
        let x = self.getCoordinate()
        let y = self.getCoordinate()
        let z = self.getCoordinate()
        
        let text = "coordinates: \(x), \(y), \(z)"
        let sceneText = SCNText(string: text, extrusionDepth: 0.1)
        sceneText.font = .systemFont(ofSize: 1)
        let textNode = SCNNode(geometry: sceneText)
        textNode.scale = SCNVector3(0.01, 0.01, 0.01)
       
        let node = SCNNode()
        node.geometry = SCNBox(
            width: 0.1,
            height: 0.1,
            length: 0.1,
            chamferRadius: 0
        )
        node.addChildNode(textNode)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue.withAlphaComponent(0.3)
        node.position = SCNVector3(x, y, z)
        self.sceneView.scene.rootNode.addChildNode(node)
    }
}

