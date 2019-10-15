//
//  ViewController.swift
//  FirebaseFb101
//
//  Created by Admin on 03/10/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit
import FacebookLogin

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let loginButton = FBLoginButton(permissions: [ .publicProfile,.email,.userFriends])
        loginButton.center = view.center

        view.addSubview(loginButton)
        if AccessToken.current != nil {
            print()
            // User is logged in, use 'accessToken' here.
        }

    }


}
