//
//  SignUpViewController.swift
//  FirebaseAuthentication_chris
//
//  Created by Admin on 30/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class SignUpViewController: ViewController {

    
    @IBOutlet weak var firstnameTextfield: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func validateFileds()->String?{
        if firstnameTextfield.text?.trimmingCharacters(in: .whitespaces) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespaces) == "" || emailTextField.text?.trimmingCharacters(in: .whitespaces) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespaces) == ""{
            return "please fill the text"
        }
        let cleanpassword = passwordTextField.text?.trimmingCharacters(in: .whitespaces)
        let isvalid=isPasswordValid(pwd:cleanpassword!)
        
        if isvalid {
            
        }
        else{
            
        }
        return nil
    }
    
    @IBAction func signupTapped(_ sender: UIButton) {
        let error=validateFileds()
        
        if error != nil
        {
            errorLabel.text=error!
            errorLabel.alpha=1
        }else{
            
            let firstName = firstnameTextfield.text?.trimmingCharacters(in: .whitespaces)
            let lastName=lastNameTextField.text?.trimmingCharacters(in: .whitespaces)
            let email = emailTextField.text?.trimmingCharacters(in: .whitespaces)
            let pwd = passwordTextField.text?.trimmingCharacters(in: .whitespaces)
            
            Auth.auth().createUser(withEmail: email!, password: pwd!) { (result, err) in
                if let err = err{
                    
                    self.errorLabel.text=(err as! String)
                    
                }else{
                    //success
                    let db=Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstName": firstName!,"lastName": lastName!,"uid":result!.user.uid], completion: { (error) in
                        if error != nil{
                            print("user data could not")
                        }
                    })
                }
                self.transitiontoHome()
        }
           
        }
    }
    
    func isPasswordValid(pwd:String)->Bool{
    //validation code
        return true
    }
    
    func transitiontoHome(){
        
        let vc=storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.HomeViewController) as? HomeViewController
        view.window?.rootViewController = vc
        view.window?.makeKeyAndVisible()
    }
   

}
