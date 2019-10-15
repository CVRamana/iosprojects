//
//  ViewController.swift
//  Facebook_signin
//
//  Created by Admin on 27/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit
import FacebookLogin

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBLoginButton(permissions: [ .publicProfile ])
        loginButton.center = view.center
        
        view.addSubview(loginButton)
        // Do any additional setup after loading the view.
    }


}

