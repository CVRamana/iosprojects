//
//  ViewController.swift
//  pod-test
//
//  Created by Admin on 23/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.show(withStatus: "hey hey")
        // Do any additional setup after loading the view.
    }


}

