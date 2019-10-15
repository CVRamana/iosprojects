//
//  ViewController.swift
//  Mvc_Demo
//
//  Created by Admin on 28/08/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var c_objs:[Controller]=[]
    @IBOutlet weak var infolLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }

    @IBAction func btnTapped(_ sender: UIButton) {
        c_objs.append(Controller("raman", 99))
      //  let c_objs1 = Controller("Shubham", 88)
        infolLabel.text=c_objs[0].Controller_Data()
      
        
    }
}

