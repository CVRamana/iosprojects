//
//  ContactModel.swift
//  UITest
//
//  Created by Appinventiv on 18/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import Foundation

struct Contact {
    
    let hello : String
    
    init(dict: JSONDictionary) {
        self.hello = dict[APIKeys.hello.rawValue] as? String ?? ""
    }
    
}
