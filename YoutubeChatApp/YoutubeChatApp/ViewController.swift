//
//  ViewController.swift
//  YoutubeChatApp
//
//  Created by Admin on 25/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imgOutlet: UIImageView!
    
    @IBOutlet weak var textText: UITextField!
    
    let imagePicker = UIImagePickerController()
    
    var ref=DatabaseReference()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let tapgesture=UITapGestureRecognizer(target: self, action: #selector(openGallery(tapGesture:)))
        
        imgOutlet.isUserInteractionEnabled=true
        
        imgOutlet.addGestureRecognizer(tapgesture)
        
        
        self.ref=Database.database().reference()
        // Do any additional setup after loading the view.
       // saveFIRData()
    }
    
    
    @objc func openGallery(tapGesture:UITapGestureRecognizer){
        print("image Tapped ")
        self.setTypeImage()
    }
    
    
    @IBAction func SaveAction(_ sender: UIButton) {
        
        saveFIRData()
    }
    
    func saveFIRData(){
        let dict = ["name":"Raman",
                    "text":textText.text!
        ]
        self.ref.child("chat").childByAutoId().setValue(dict)
    }

}
extension ViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func setTypeImage(){
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.delegate=self
            imagePicker.isEditing=true
            self.present(imagePicker, animated: true, completion: nil)
        }
        
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! 
    }
    
    
}
