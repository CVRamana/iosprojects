//
//  Weather.swift
//  Brian_Parsing
//
//  Created by Admin on 23/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import Foundation

struct Weather{
    let summary:String
    let icon:String
    let temprature:Double
    
    init(json:[String:Any]) throws {
        guard let summary=json["summary"] as? String else {
            throw SerializationError.missing("Summary is missing")}
        
       guard let icon=json["icon"] as? String else {
        throw SerializationError.missing("Summary is missing")}
        
       guard let temprature=json["temprature"] as? Double else {
        throw SerializationError.missing("Summary is missing")}
        
        self.summary=summary
        self.icon=icon
        self.temprature=temprature
        
    }
}
