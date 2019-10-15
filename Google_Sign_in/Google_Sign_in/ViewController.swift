//
//  ViewController.swift
//  Google_Sign_in
//
//  Created by Admin on 26/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase


class ViewController:UIViewController{
    
    
 //   @IBOutlet weak var GIDSignIn: UIButton!
    @IBOutlet weak var SignInButton: GIDSignInButton!
    
    override func viewDidLoad() {
         super.viewDidLoad()
         GIDSignIn.sharedInstance().presentingViewController = self
         GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        
    }

    @IBAction func didTapSignOut(_ sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
    }
   
    
    @IBAction func SignInAction(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    
}
