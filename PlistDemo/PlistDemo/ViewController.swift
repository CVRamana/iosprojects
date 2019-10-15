//
//  ViewController.swift
//  PlistDemo
//
//  Created by Admin on 08/10/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit


struct Preferences: Codable {
    var webService:String
    var boll:Bool
     var Item_per_month:Int
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
   
       dataOfPlist()
        // Do any additional setup after loading the view.
    }
    
    func dataOfPlist(){
        if let fruits = getData(withName: "myinfo"){
            print("khdg")
           print(fruits)
        }
    }
    
    func getData(withName name:String)->[String]?
    {
        
        if let path        = Bundle.main.path(forResource: "Preferences", ofType: "plist"),
            let xml         = FileManager.default.contents(atPath: path),
            let preferences = try? PropertyListDecoder().decode(Preferences.self, from: xml)
        {
            print(preferences.webService)
        }
        
        
        
        
        if let path = Bundle.main.path(forResource: name, ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path){
        print("jgydsu")
        return (try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)) as? [String]
        }
        return nil
    }

}

