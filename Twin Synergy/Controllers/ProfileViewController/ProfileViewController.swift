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
    let emailTo = "info@twinsynergy.co.th"
    let contactTelephoneNumber = "+66925905444"
    let titleEmail = "q-o-o-p"
    let emailDetail = """
    This message send from \"Twin Synergy\" iOS Application.
    """
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var telephoneLabel: UILabel!
    @IBOutlet var emailMeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        composeVC.setToRecipients([emailTo])
        composeVC.setSubject(titleEmail)
        composeVC.setMessageBody(emailDetail, isHTML: false)
        present(composeVC, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func telephoneHandleTap(sender: UITapGestureRecognizer) {
        guard ((sender.view as? UILabel)?.text) != nil else { return }
        if let url = URL(string: "tel://\(contactTelephoneNumber)"), UIApplication.shared.canOpenURL(url) {
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
