//
//  APICaller.swift
//  UITest
//
//  Created by Appinventiv on 18/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import Foundation

final class APICaller {
    
    private init() {}
    
    static func callHelloAPI(url: String, param: JSONDictionary, callBack:@escaping(_ success: Bool, _ message: String, _ contact: Contact? )->()) {
        
        Networking.callAPI(url: url, param: param) { (err, jsonDict) in
            if err == nil, let dict = jsonDict {
                
                //parsing of contact model
                let c = Contact(dict: dict)
                callBack(success, "Hurrey!", c)
            }
        }
    }
}
