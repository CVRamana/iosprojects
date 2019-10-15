//
//  ViewController.swift
//  Custom_textfiled
//
//  Created by Admin on 23/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    
    @IBOutlet weak var textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        textfield.delegate=self
        
        let img=UIImageView(frame: CGRect(x: 5, y: 5, width: 20, height:20))
        
        img.image=UIImage(named: "icons8-user-100")
        
        let paddingView = UIView(frame: CGRect(x: 20, y: 0, width: 30, height:28))
        
        print(textfield.frame.height)
        
        paddingView.backgroundColor = .blue
        
        paddingView.addSubview(img)
        
        textfield.leftView = paddingView
        
        textfield.leftViewMode = UITextField.ViewMode.always
       
    }
}

extension ViewController:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textfield.resignFirstResponder()
        return true
    }
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        return true
//    }
}
