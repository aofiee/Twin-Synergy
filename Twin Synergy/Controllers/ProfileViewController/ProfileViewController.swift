//
//  ProfileViewController.swift
//  Twin Synergy
//
//  Created by SkullTree on 30/12/2560 BE.
//  Copyright © 2560 SkullTree. All rights reserved.
//

import UIKit

class ProfileViewController: CustomNavigationController {

    @IBOutlet var addressLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        addressLabel.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }
    @IBAction func handleTap(sender: UITapGestureRecognizer) {
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
