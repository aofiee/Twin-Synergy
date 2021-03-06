//
//  MyColorProtocol.swift
//  Twin Synergy
//
//  Created by SkullTree on 30/12/2560 BE.
//  Copyright © 2560 SkullTree. All rights reserved.
//

import Foundation
import UIKit
struct MyColorStruct {
    let basedColor: String
    let basedBarColor: String
    let secondBarColor: String
    let titleColor: String
    init(basedColor: String,
         basedBarColor: String,
         secondBarColor: String,
         titleColor: String) {
        //        let basedColor: String = "#FF8A00"
        //        let basedBarColor: String = "#356A97"
        //        let secondBarColor: String = "#17274E"
        //        let titleColor: String = "#FFFFFF"
        self.basedColor = basedColor
        self.basedBarColor = basedBarColor
        self.secondBarColor = secondBarColor
        self.titleColor = titleColor
    }
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}

