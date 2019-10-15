//
//  ViewModel.swift
//  DelegateDemo
//
//  Created by Deepak Saxena on 28/08/19.
//  Copyright © 2019 Deepak Saxena. All rights reserved.
//

import Foundation

protocol ViewModelProtocol: class {
    func willHitAPI(_ obj: ViewModel)
    func apiHiSuccessful(_ obj: ViewModel, message: String)
    func apiHitFail(_ obj: ViewModel, message: String)
}

class ViewModel {
    
    weak var delegate: ViewModelProtocol?
    
    /// this method is used for API callfor for the purpose of ....
    func hitAPI() {
        
        self.delegate?.willHitAPI(self)
        
        delay(seconds: 1) {[weak self] in
            guard let self = self else { return }
            self.delegate?.apiHiSuccessful(self, message: "API hit successfully")
        }
        
        delay(seconds: 1) {[weak self] in
            guard let self = self else { return }
            self.delegate?.apiHitFail(self, message: "Net API fails")
        }
    }
}


func delay(seconds: Double, completion: @escaping () -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
        completion()
    }
}
