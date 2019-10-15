//
//  ViewController.swift
//  ImageLoadingFromURL
//
//  Created by Admin on 14/10/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    let url1 = URL(string: "http://www.simplifiedtechy.net/wp-content/uploads/2017/07/simplified-techy-default.png")
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let session1 = URLSession(configuration: .default)
        let getimagefromUrl = session1.dataTask(with: url1!) { (data, response, error) in
            if let e=error{
                print(e)
            }else{
            if (response as? HTTPURLResponse) != nil{
                if let imgData = data{
                let image = UIImage(data: imgData)
                self.img.image = image
            }
        }
        }

    }
}
   

}

