//
//  ConverterViewController.swift
//  UITest
//
//  Created by Appinventiv on 26/08/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit

class ConverterViewController : BaseVC {
    
    private let controller = ConverterController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.controller.testAPICall()
    }
    
    override func bindController() {
        self.controller.delegate = self
    }
}

extension ConverterViewController: ConverterControllerProtocol {
    
    func willHitAPI() {
        //Show loader
    }
    
    func apiHitSuccessFul(messages: String) {
        //whatever functionality
    }
    
    func apiHitFail(message: String) {
        //Snakbar or toast message
    }
    
    
}
