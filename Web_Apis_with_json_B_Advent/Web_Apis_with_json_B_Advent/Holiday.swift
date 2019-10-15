//
//  Holiday.swift
//  Web_Apis_with_json_B_Advent
//
//  Created by Admin on 24/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import Foundation

struct HolidayResponse:Decodable {
    var holidays:Holidays
}
struct Holidays:Decodable {
    var holidayDetails:[HolidayDetails]
}

struct HolidayDetails:Decodable
{
    var name:String
    var date_info:Dateinfo
}
struct Dateinfo:Decodable{
    var iso:String
    
}
