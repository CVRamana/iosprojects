//
//  User+CoreDataProperties.swift
//  CoredataCrud
//
//  Created by Admin on 09/10/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var password: String?
    @NSManaged public var email: String?
    @NSManaged public var username: String?

}
