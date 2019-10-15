//
//  ViewController.swift
//  Alamofire_with_swiftyJson
//
//  Created by Admin on 05/10/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class ViewController: UIViewController {

    @IBOutlet weak var textfil: UITextField!
    
    @IBOutlet weak var chuckLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: Any) {
        let url="https://matchilling-chuck-norris-jokes-v1.p.rapidapi.com/jokes/random"
        let apiKey="fec0e332cemshe0fc108e8e5c643p18f387jsn753633ae3e89"
        let header: HTTPHeaders =
            ["x-rapidapi-key":apiKey]
        AF.request(url, method: .get, parameters: .none, encoding: UTF16.self as! ParameterEncoding, headers: header, interceptor: .none).responseJSON { (response) in
            if response.result != nil{
                print("got it")
                if let chuckResponse = response.result{
                    chuckResponse:
                }
                
            }
        }
    }
    
}

