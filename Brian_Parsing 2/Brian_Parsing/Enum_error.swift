//
//  Enum_error.swift
//  Brian_Parsing
//
//  Created by Admin on 23/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import Foundation

enum SerializationError:Error{
    case missing(String)
    case invalid(String,Any)
}
