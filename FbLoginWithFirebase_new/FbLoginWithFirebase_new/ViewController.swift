//
//  ViewController.swift
//  FbLoginWithFirebase_new
//
//  Created by Admin on 30/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let loginButton = FBLoginButton()
        // Optional: Place the button in the center of your view.
        loginButton.center = view.center
        view.addSubview(loginButton)
        
        
       // super.viewDidLoad()
        if (AccessToken.current != nil) {
            // User is logged in, do work such as go to next view controller.
        }
        
        loginButton.permissions = ["public_profile", "email"]
    }


}

