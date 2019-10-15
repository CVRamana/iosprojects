//
//  Model.swift
//  Mvc_Demo
//
//  Created by Admin on 28/08/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import Foundation

struct Person{
    var name:String
    var age:Int
    init(_ name:String ,_ age:Int) {
        self.name=name
        self.age=age
    }
    func fromModel()->String{
        return "\(name)  and \(age) from the Model"
    }
}
