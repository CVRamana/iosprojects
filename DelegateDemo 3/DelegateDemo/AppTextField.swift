//
//  AppTextField.swift
//  DelegateDemo
//
//  Created by Deepak Saxena on 28/08/19.
//  Copyright © 2019 Deepak Saxena. All rights reserved.
//

import UIKit

class AppTextField: UITextField {
    
    var borderColor: CGColor? {
        get {
            return self.layer.borderColor
        }
        
        set {
            self.layer.borderWidth = 1
            self.layer.borderColor = newValue
        }
    }
    
    var cornerRadius: CGFloat {
        set  {
            self.layer.masksToBounds = true
            self.layer.cornerRadius = newValue
        }
        get {
            return self.layer.cornerRadius
        }
    }
    
}
