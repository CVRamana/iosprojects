//
//  ViewController.swift
//  UITest
//
//  Created by Appinventiv on 26/08/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.roundLabel.backgroundColor = UIColor.black
        self.roundLabel.layer.cornerRadius = 25
        view.backgroundColor = UIColor(patternImage: UIImage(named: "iphone.png")!)
        // Do any additional setup after loading the view.
    }
    

}

