//
//  ViewController.swift
//  FireBase_auth_chris
//
//  Created by Admin on 30/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit

import FirebaseUI
class ViewController: UIViewController {

    @IBOutlet weak var demolbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func login(_ sender: UIButton) {
       let authUi = FUIAuth.defaultAuthUI()
        guard authUi != nil else {
            return
        }
        authUi?.delegate=self
       
        self.present((authUi?.authViewController())!, animated: true, completion: nil)
    }
    
}
extension ViewController:FUIAuthDelegate{
   
    
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        guard error != nil else {
            return
        }
       // authDataResult.
        performSegue(withIdentifier: "go home", sender: self)
    }
    
}
