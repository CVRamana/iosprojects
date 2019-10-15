//
//  ViewController.swift
//  C_Data_Demo
//
//  Created by Admin on 01/10/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    var persons=[Person]()
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let fetchRequest:NSFetchRequest<Person>=Person.fetchRequest()
        do{
      let people = try  PersistenceService.context.fetch(fetchRequest)
            self.persons=people
            tableview.reloadData()
        }catch{
            
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func plusTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Add person", message: "please provide the appropriate data", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder="Name"
        }
        alert.addTextField { (textField) in
            textField.placeholder="age"
            textField.keyboardType = .numberPad
        }
        
        let action = UIAlertAction(title: "action", style: .default) { (_) in
            let name=alert.textFields?.first?.text
            let age=alert.textFields?.last?.text
            print("\(name!) and \(age!)")
            
            let person=Person(context: PersistenceService.context)
            person.name=name
            person.age=Int32(age!)!
            PersistenceService.saveContext()
            
            self.persons.append(person)
            self.tableview.reloadData()
            
    
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
extension ViewController:UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text=persons[indexPath.row].name
        cell.detailTextLabel?.text=String(persons[indexPath.row].age)
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
   
    
    
}
