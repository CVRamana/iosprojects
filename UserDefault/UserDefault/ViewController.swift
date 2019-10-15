//
//  ViewController.swift
//  UserDefault
//
//  Created by Admin on 08/10/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var textfield: UITextField!
    
    @IBOutlet weak var saveDefault: UIButton!
    
    var isDark=false
    let defaults=UserDefaults.standard
    
    struct Keys{
        static let petname = "petname"
        static let prefersDarkmode = "prefresDarkmode"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
  
    override func viewWillAppear(_ animated: Bool) {
        checkforStylePrefrences()
    }
   
    @IBAction func segementedTapped(_ sender: UISegmentedControl) {
        isDark=(sender).selectedSegmentIndex == 1
        saveStylePrefrences()
      //  updateStyle()
    }
    
    @IBAction func saveDefaultTapped(_ sender: Any) {
    }
    
    func updateStyle(){
        UIView.animate(withDuration: 0.4) {
            self.view.backgroundColor = self.isDark ? UIColor.gray : .white
            //self.textfield.updateStyle(isDark : self.isDark)
        }
           
       }
    func saveStylePrefrences(){
        defaults.set(isDark, forKey: Keys.prefersDarkmode)
       // defaults.set(true, forKey: "isDark")
    }
    
    func checkforStylePrefrences(){
        let prefersDarkMode = defaults.bool(forKey: Keys.prefersDarkmode)
        if prefersDarkMode{
            isDark=true
            updateStyle()
        }else{
            view.backgroundColor = .cyan
        }
        
    }
  
    
}

