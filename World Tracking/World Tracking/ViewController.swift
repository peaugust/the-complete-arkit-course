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
}

