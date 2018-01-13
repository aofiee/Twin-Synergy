//
//  ProfileModelView.swift
//  Twin Synergy
//
//  Created by SkullTree on 12/1/2561 BE.
//  Copyright © 2561 SkullTree. All rights reserved.
//

import Foundation

class ProfileViewModel {
    private var profile: ProfileModel
    init(profile: ProfileModel) {
        self.profile = profile
    }
    var address: String {
        return profile.addressString
    }
    var telephone: String {
        return profile.telephoneString
    }
    var email: String {
        return profile.emailString
    }
    var emailTo: String {
        return profile.emailTo
    }
    
    var contactTelephoneNumber: String {
        return profile.contactTelephoneNumber
    }
    
    var titleEmail: String {
        return profile.titleEmail
    }
    
    var emailDetail: String {
        return profile.emailDetail
    }
}

