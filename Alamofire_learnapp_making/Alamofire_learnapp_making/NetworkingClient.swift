//  NetworkingClient.swift
//  Alamofire_learnapp_making
//
//  Created by Admin on 04/10/19.
//  Copyright © 2019 Appinventiv. All rights reserved.

import Foundation
import Alamofire

class NetworkingClient{
    
    typealias webServiceResponse = ([[String:Any]]? ,Error? )->Void
    
    func excute(_ url:URL, completion: @escaping webServiceResponse )
    {
    
//       let urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "POST"
//        urlRequest.addValue(<#T##value: String##String#>, forHTTPHeaderField: <#T##String#>)

        AF.request("https://jsonplaceholder.typicode.com/posts").validate().responseJSON { (response) in
            if let error = response.error{
                completion(nil,error)
                
            }else if let jsonArray = response.result as? [[String:Any]] {
                
                completion(jsonArray,nil)
                
            }else if let jsonDict = response.result as? [String:Any] {
                completion([jsonDict],nil)
            }
        }
    }

}
