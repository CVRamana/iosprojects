//
//  ViewController.swift
//  Facebook_firebase_login
//
//  Created by Admin on 02/10/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit
import FacebookCore
import FBSDKLoginKit
import FirebaseAuth

class ViewController: UIViewController,LoginButtonDelegate{
  
    //@IBOutlet weak var butt: FBLoginButton!
    
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if let error = error {
            print(error.localizedDescription)
            return
        }else{
            let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
            
            Auth.auth().signIn(with: credential) { (authResult, error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }else{
                    print(authResult?.user.email )
                }
              
            }
        }
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("User logged out")
    }
    
 

    override func viewDidLoad() {
      
        super.viewDidLoad()
        let loginButton = FBLoginButton()
        loginButton.delegate = self
       
       
       
        // Do any additional setup after loading the view.
    }


}

