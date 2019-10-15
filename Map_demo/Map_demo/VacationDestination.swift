//
//  VacationDestination.swift
//  Map_demo
//
//  Created by Admin on 30/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import Foundation
import GoogleMaps
class VacationDestination :NSObject{
    var name:String?
    var location:CLLocationCoordinate2D
    var zoom:Float?
    init(name:String,location:CLLocationCoordinate2D,zoom:Float){
        self.location=location
        self.name=name
        self.zoom=zoom
        
    }

}
