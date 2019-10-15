//
//  BaseVC.swift
//  Networking
//
//  Created by Appinventiv on 18/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import Foundation
import UIKit

class BaseVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindController()
    }
    
    func bindController() {
        //To be override
    }
}
