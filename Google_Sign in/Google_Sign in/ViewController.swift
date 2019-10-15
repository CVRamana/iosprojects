//
//  ViewController.swift
//  Google_Sign in
//
//  Created by Admin on 26/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
         GIDSignIn.sharedInstance().presentingViewController = self
        
        // Do any additional setup after loading the view.
    }


}

