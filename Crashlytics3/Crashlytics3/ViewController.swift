//
//  ViewController.swift
//  Crashlytics3
//
//  Created by Admin on 26/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit
//import Pods_Crashlytics3
import Crashlytics


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func crashAction(_ sender: UIButton) {
        Crashlytics.sharedInstance().crash()
        
        
    }
    
    
}

