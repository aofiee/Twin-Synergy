//
//  ARCameraViewController.swift
//  Twin Synergy
//
//  Created by SkullTree on 18/1/2561 BE.
//  Copyright © 2561 SkullTree. All rights reserved.
//

import UIKit
import ARKit
import Material

class ARCameraViewController: UIViewController, ARSCNViewDelegate {
    let configuration = ARWorldTrackingConfiguration()
    @IBOutlet weak var sceneView: ARSCNView!

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareForARSetup()
    }
    fileprivate func prepareForARSetup(){
        //        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints,ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        //        self.sceneView.showsStatistics = true
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true;
        self.sceneView.delegate = self
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.sceneView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        let sceneViewTappedOn = sender.view as! SCNView
        let touchCoordinates = sender.location(in: sceneViewTappedOn)
        let hitTest = sceneViewTappedOn.hitTest(touchCoordinates)
        if hitTest.isEmpty {
            print("didn't touch anything")
        } else {
            let results = hitTest.first!
            let geometry = results.node.geometry
            print(geometry as Any)
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        let earth = SCNNode()
        earth.geometry = SCNSphere(radius: 0.2)
        earth.geometry?.firstMaterial?.diffuse.contents = UIImage.init(named: "moon")
        //earth.geometry?.firstMaterial?.specular.contents = UIColor.yellow
        earth.position = SCNVector3(0,0,-2)
        self.sceneView.scene.rootNode.addChildNode(earth)

        let action = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 60)
        let forever = SCNAction.repeatForever(action)
        earth.runAction(forever)
        
//        let jellyFishScene = SCNScene(named: "art.scnassets/Shark.scn")
//        let jellyfishNode = jellyFishScene?.rootNode.childNode(withName: "Shark", recursively: false)
//        jellyfishNode?.position = SCNVector3(0,0,-5)
//        self.sceneView.scene.rootNode.addChildNode(jellyfishNode!)
    }
    @IBAction func closeBtnAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension Int {
    var degreesToRadians: Double { return Double(self) * .pi/180}
}
