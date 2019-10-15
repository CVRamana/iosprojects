//
//  ViewController.swift
//  CrudFirebase_demo
//
//  Created by Admin on 01/10/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit
import FirebaseFirestore


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let db=Firestore.firestore()
        let doc=db.collection("wine").document()
        doc.setData(["name":"Blender pride","invented":1988,"Mrp":8889,"id":doc.documentID])
        // Do any additional setup after loading the view.
    }


}

