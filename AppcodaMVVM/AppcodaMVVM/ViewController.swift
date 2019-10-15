//
//  ViewController.swift
//  AppcodaMVVM
//
//  Created by Admin on 04/10/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "DetailSegue" {
            
            if let destinationViewController = segue.destination as? DetailViewController
            {
                let indexPath = self.tableView.indexPathForSelectedRow!
                let index = indexPath.row
                // #2 - The ViewModel is the app's de facto data source.
                // The ViewModel data for the currently-selected table
                // view cell representing a Messier object is passed to
                // a detail view controller via a segue.
                destinationViewController.messierViewModel = messierViewModel[index]
            }
        }
        
    } // end fun

}

