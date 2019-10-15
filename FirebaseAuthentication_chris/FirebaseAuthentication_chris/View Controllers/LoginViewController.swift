//
//  LoginViewController.swift
//  FirebaseAuthentication_chris
//
//  Created by Admin on 30/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: ViewController {

    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var secondNameTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        //validate the text Field
        let email = firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = secondNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        //clean version of email and password
        
        
        
        //authenticate user
        Auth.auth().signIn(withEmail: email!, password: password!) { result, error in
            if error != nil{
                self.errorLabel.text=error!.localizedDescription
                self.errorLabel.alpha=1
            }else{
                
                let vc=self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.HomeViewController) as? HomeViewController
                self.view.window?.rootViewController = vc
               self.view.window?.makeKeyAndVisible()
                
            }
        }
        
        
        
    }
    
  

}
