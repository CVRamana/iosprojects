//
//  ViewController.swift
//  AppinventivFB_login
//
//  Created by Admin on 27/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase


class ViewController: UIViewController,LoginButtonDelegate{
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let loginButton = FBLoginButton()
        // Optional: Place the button in the center of your view.
        loginButton.center = view.center
        view.addSubview(loginButton)
        
        loginButton.delegate = self
        loginButton.permissions = ["email"]
//        loginButton.permissions = ["public_profile", "email"]
//        if (AccessToken.current != nil) {
//            // User is logged in, do work such as go to next view controller.
//
//        loginButton.permissions=["email","public_profile"]
//
//        }
    }

    
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        
        if error != nil{
        print(error ?? "")
            return
        }
        print("succecfully loged in facebook")
        GraphRequest(graphPath: "me", parameters: ["fields" : "id, name, picture, email"]).start { (connection, result, error) in
            print(result ?? "")
            print("hdftysuyt")
        }
    }
    
    
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("User Log out")
    }
    

}

