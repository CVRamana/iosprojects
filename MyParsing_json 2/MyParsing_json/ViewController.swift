//  ViewController.swift
//  MyParsing_json
//
//  Created by Admin on 23/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    var country_Array: [Contry] = []

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate=self
        tableview.dataSource=self
        
        getRequest { (countries) in
            //json=countries
            self.country_Array.append(contentsOf: countries)
          //  print(self.country_Array)
        
//            guard  let name =  self.country_Array.first?.currencies[0].name,
//
//                let nativeName = self.country_Array[0].languages[1].nativeName,
//
//                let acronym = self.country_Array[2].regionalBlocs[0].acronym
////
////                    print(name)
////                    print(nativeName)
////                    print(acronym)
//
//                else {
//                    print("It is nil")
//                    return
//                }
        }
       // tableview.reloadData()
    }
    
    func getRequest(completion: @escaping ([Contry]) -> Void) {
        
        let link="https://restcountries.eu/rest/v2/all"
        
        guard let url=URL(string: link) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else {return}
            
            do{
                let countries = try JSONDecoder().decode([Contry].self, from: data)
              
                completion(countries)
                DispatchQueue.main.async {
                     self.tableview.reloadData()
                }
               
            }
            catch{
                print(error.localizedDescription)
            }
            }.resume()
    }

    
    //Table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return country_Array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=(tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
            )
        cell?.nameLbl.text = "Country:\(country_Array[indexPath.row].name ?? "")"
        cell?.capLbl.text = "Capital: \(country_Array[indexPath.row].capital ?? "")"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    

}

