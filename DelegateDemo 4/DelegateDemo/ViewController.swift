//
//  ViewController.swift
//  DelegateDemo
//
//  Created by Deepak Saxena on 28/08/19.
//  Copyright © 2019 Deepak Saxena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var txtfld: AppTextField!
    
    private let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        txtfld.delegate = self
        txtfld.cornerRadius = 5;
        txtfld.borderColor = UIColor.red.cgColor
        
        print(txtfld.cornerRadius)
        
    }
    
    @IBAction private func btnAction(_ sender: UIButton) {
        viewModel.hitAPI()
    }
}


//MARK: - ViewModelProtocol implementation -
extension ViewController: ViewModelProtocol {
    func willHitAPI(_ obj: ViewModel) {
        if obj === viewModel {
            
        } else {
            
        }
        print("show loader")

    }
    
    func apiHiSuccessful(_ obj: ViewModel, message: String) {
        print("hide loader")
        print(message)

    }
    
    func apiHitFail(_ obj: ViewModel, message: String) {
        print("hide loader")
        print(message)
    }
    
}


extension ViewController: UITextFieldDelegate {
    
    @objc private func textDidChange(_ textFiled: UITextField ) {
    }
}
