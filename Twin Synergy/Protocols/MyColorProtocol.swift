//
//  MyColorProtocol.swift
//  Twin Synergy
//
//  Created by SkullTree on 30/12/2560 BE.
//  Copyright © 2560 SkullTree. All rights reserved.
//

import Foundation
import UIKit

protocol MyColorProtocol {
    func hexStringToUIColor (hex:String) -> UIColor
    func hexStringToUIColor2 (hex:String) -> UIColor
    var basedColor: String { get set }
    var basedBarColor: String { get set }
    var secondBarColor: String { get set }
    var titleColor: String { get set }
}

extension MyColorProtocol {
    func hexStringToUIColor2 (hex:String) -> UIColor {
        return UIColor.black
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

