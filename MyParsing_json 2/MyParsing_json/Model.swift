//
//  Model.swift
//  MyParsing_json
//
//  Created by Admin on 24/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import Foundation

struct Contry:Decodable{
    var name:String?
    var capital:String?
    var region:String?
    var altSpellings:[String]
    var currencies:[Currency]
    var languages:[Language]
    var regionalBlocs:[RegionalBloc]
}

struct Currency:Decodable {
    var code:String?
    var name:String?
    var symbol:String?
}

struct Language:Decodable {
   var iso639_1:String?
   var iso639_2:String?
   var name:String?
   var nativeName:String?

}

struct RegionalBloc:Decodable {
   var acronym:String?
    var name:String?
    var otherAcronyms:[String?]?
    var otherNames:[String?]?
}
