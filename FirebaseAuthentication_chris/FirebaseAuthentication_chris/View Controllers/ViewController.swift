//
//  ViewController.swift
//  FirebaseAuthentication_chris
//
//  Created by Admin on 30/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit
import AVKit
class ViewController: UIViewController {

    var vedioPalyer:AVPlayer?
    var vedioPlayerLayer:AVPlayerLayer?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
       setupVedio()
    }
    func setupVedio(){
     let bp = Bundle.main.path(forResource: "loginbg", ofType: "mp4")
        guard bp != nil else {return}
        let url=URL(fileURLWithPath: bp!)
        let item=AVPlayerItem(url: url)
        vedioPalyer=AVPlayer(playerItem: item)
        vedioPlayerLayer=AVPlayerLayer(player: vedioPalyer)
        vedioPlayerLayer?.frame=CGRect(x: -self.view.frame.size.width*1.5, y: 0, width: self.view.frame.size.width*4, height: self.view.frame.size.height)
        
        view.layer.insertSublayer(vedioPlayerLayer!, at: 0)
        vedioPalyer?.playImmediately(atRate: 0.3)
    }

}

