//
//  ConverterController.swift
//  Networking
//
//  Created by Appinventiv on 18/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import Foundation

protocol ConverterControllerProtocol: class {
    func willHitAPI()
    func apiHitSuccessFul(messages: String)
    func apiHitFail(message: String)
}

class ConverterController {
    
    weak var delegate: ConverterControllerProtocol?
    
    private(set) var contact: Contact?
    
    func testAPICall() {
        
        self.delegate?.willHitAPI()
        
        APICaller.callHelloAPI(url: Endpoints.helloUrl.rawValue, param: [:]) {[weak self] (success, message, contactModel) in
            
            guard let self = self else { return }
            
            if success, let c = contactModel {
                self.contact = c
                self.delegate?.apiHitSuccessFul(messages: message)
            } else {
                self.delegate?.apiHitFail(message: message)
            }
        }
    }
}
