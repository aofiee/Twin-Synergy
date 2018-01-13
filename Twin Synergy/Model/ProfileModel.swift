//
//  ProfileModel.swift
//  Twin Synergy
//
//  Created by SkullTree on 12/1/2561 BE.
//  Copyright © 2561 SkullTree. All rights reserved.
//

import Foundation

class ProfileModel {
    var addressString:String
    var telephoneString:String
    var emailString:String
    
    let emailTo = "info@twinsynergy.co.th"
    let contactTelephoneNumber = "+66925905444"
    let titleEmail = "q-o-o-p"
    let emailDetail = """
    This message send from \"Twin Synergy\" iOS Application.
    """
    
    init(address: String, telephone: String, email: String) {
        self.addressString = address
        self.telephoneString = telephone
        self.emailString = email
    }
}
