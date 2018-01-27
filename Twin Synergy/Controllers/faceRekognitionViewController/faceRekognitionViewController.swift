//
//  faceRekognitionViewController.swift
//  Twin Synergy
//
//  Created by SkullTree on 26/1/2561 BE.
//  Copyright © 2561 SkullTree. All rights reserved.
//

import UIKit
import AWSS3
import AWSRekognition

class faceRekognitionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let rekognitionClient = AWSRekognition.default()
        let sourceImage = UIImage(named: "aof03")
        let targetImage = UIImage(named: "aof02")
//        let bucket = "aofiee-identity"
//        let region = "us-east-1"
        
        let sourceImageByte = AWSRekognitionImage()
        let targetImageByte = AWSRekognitionImage()
        sourceImageByte!.bytes = UIImageJPEGRepresentation(sourceImage!, 0.7)
        targetImageByte!.bytes = UIImageJPEGRepresentation(targetImage!, 0.7)
        
        let rekognition = AWSRekognition()
        let request = AWSRekognitionCompareFacesRequest()
        
        request?.sourceImage = sourceImageByte
        request?.targetImage = targetImageByte
        request?.similarityThreshold = 70.0
        let result = rekognition.compareFaces(request!)
        print(result)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
