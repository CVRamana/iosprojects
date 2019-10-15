//
//  ViewController.swift
//  Brian_Parsing
//
//  Created by Admin on 23/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    func getData(){
        let url=URL(string: "https://")
        URLSession.shared.dataTask(with: url!) { (data, response, err) in
            if let data = data{
                do{
                    if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                        if let daily = json["data"] as? [[String:Any]]{
                            
                        }
                    }
                }catch{
                    
                }
            }
        }
        
    }

}

