//
//  ProfileViewController.swift
//  Twin Synergy
//
//  Created by SkullTree on 30/12/2560 BE.
//  Copyright © 2560 SkullTree. All rights reserved.
//

import UIKit
import MessageUI

class ProfileViewController: CustomNavigationController,MFMailComposeViewControllerDelegate {
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var telephoneLabel: UILabel!
    @IBOutlet var emailMeLabel: UILabel!
    private var profile: ProfileViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let mAddress = """
                        Twin synergy Co.,Ltd.
                        1,3 Soi 4 Seri Village 8  Suan-Luang
                        Suan-Luang bangkok 10250
                       """
        self.profile = ProfileViewModel(mProfile: ProfileModel(address: mAddress, telephone: "+66925905444", email: "khomkrid@twinsynergy.co.th"))
        addressLabel.text = self.profile.address
        telephoneLabel.text = self.profile.telephone
        emailMeLabel.text = self.profile.email
        
        let tapGestureForAddress = UITapGestureRecognizer(target: self, action: #selector(mapHandleTap(sender:)))
        addressLabel.addGestureRecognizer(tapGestureForAddress)
        
        let tabGestureForTelephone = UITapGestureRecognizer(target: self, action: #selector(telephoneHandleTap(sender:)))
        telephoneLabel.addGestureRecognizer(tabGestureForTelephone)
        
        let tabGestureForEmail = UITapGestureRecognizer(target: self, action: #selector(emailHandleTap(sender:)))
        emailMeLabel.addGestureRecognizer(tabGestureForEmail)
    }

    @IBAction func emailHandleTap(sender: UITapGestureRecognizer) {
        guard ((sender.view as? UILabel)?.text) != nil else { return }
        guard MFMailComposeViewController.canSendMail() else {
            print("Mail services are not available")
            return
        }
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        composeVC.setToRecipients([self.profile.emailTo])
        composeVC.setSubject(self.profile.titleEmail)
        composeVC.setMessageBody(self.profile.emailDetail, isHTML: false)
        present(composeVC, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func telephoneHandleTap(sender: UITapGestureRecognizer) {
        guard ((sender.view as? UILabel)?.text) != nil else { return }
        if let url = URL(string: "tel://\(self.profile.contactTelephoneNumber)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }

    @IBAction func mapHandleTap(sender: UITapGestureRecognizer) {
        guard ((sender.view as? UILabel)?.text) != nil else { return }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MapStoryboard")
        navigationController?.pushViewController(vc, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
