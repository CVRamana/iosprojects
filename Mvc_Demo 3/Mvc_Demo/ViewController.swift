//
//  ViewController.swift
//  Mvc_Demo
//
//  Created by Admin on 28/08/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var infolLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
//    var pinfo:String=""
//    var Ainfo:String=""
    @IBAction func btnTapped(_ sender: UIButton) {
        infolLabel.text = "\(pinfo)\(Ainfo)"
        
    }
}

