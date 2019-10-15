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
    func personInfo()->String{
        return "\(name)  \(age)"
    }
}
struct Address{
    var street:String
    var House_No:Int
    func AdressInfo()->String{
        return "\(street)  \(House_No)"
    }
}
