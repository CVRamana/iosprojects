//
//  Person+CoreDataProperties.swift
//  C_Data_Demo
//
//  Created by Admin on 01/10/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int32

}
