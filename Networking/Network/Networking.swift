//
//  Networking.swift
//  UITest
//
//  Created by Appinventiv on 18/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String: Any]
typealias JSONArray = [JSONDictionary]
typealias CallBack = (_ err: Error?, _ dict: JSONDictionary?)->()

final class Networking {
    
    private init() { }
    
    static func callAPI(url: String, param: JSONDictionary, callBack:@escaping CallBack) {

        guard let url = URL(string: url) else {
            callBack()
            return
        }
            
        URLSession.shared.dataTask(with: url){ (data,response,err) in
            
            guard let unwrappedData = data else {
                callBack()
                return
            }
            do {
                if let jsonArray = try JSONSerialization.jsonObject(with: unwrappedData, options : .allowFragments) as? JSONDictionary {
                    callBack()
                } else {
                    print("bad json")
                }
            } catch let error as NSError {
                print(error)
            }
    }
}
