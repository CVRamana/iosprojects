//
//  View.swift
//  Mvc_Demo
//
//  Created by Admin on 28/08/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import Foundation
class Controller{
   // var infoFromModel:String?
    
    var name:String?
    var age:Int?
    init(_ name:String,_ age:Int) {
        self.name=name
        self.age=age
    }
    
    func Controller_Data()->String
    {
        print("name: \(name ?? "jhgfd") age: \(age ?? 0)   from controller")
        let fromController_to_view = "name: \(name ?? "jhgfd") age: \(age ?? 0)   from controller"
       let p = Person(name!, age!)
       print( p.fromModel() )
        return fromController_to_view
    }
    
}


