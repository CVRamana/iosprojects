//  ViewController.swift
//  FileManager
//
//  Created by Admin on 09/10/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
     let fileManager = FileManager.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        FileManagerOperations()
        readFile()
        moveFile()
        copyFile()
        listFile()
        removeFile()
    }
   
    func FileManagerOperations(){
        
     //create directory
    let documentsPath = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])
        let logsPath = documentsPath.appendingPathComponent("data")
    print(logsPath!)
        
    do{
    try fileManager.createDirectory(atPath: logsPath!.path, withIntermediateDirectories: true, attributes: nil)
    
    }catch let error as NSError{
        print("Unable to create directory",error)
    }
}
    
    func readFile(){
        let file = "file1.txt"
        let text = "some text"
        guard let dir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first  else {return}
         let fileURL = dir.appendingPathComponent(file)
            //writing
            
            do{
                try text.write(to: fileURL, atomically: false, encoding: .utf8)
            }catch{
                print("cant write…")
            }
        
        do{
            
            //reading the content
            let text = try String(contentsOf: fileURL, encoding: .utf8)
            print(text)
        }catch{
            print("can't read…")
        }
    }

    func moveFile(){
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let oldPath = dir.appendingPathComponent("file1.txt")
            let newPath = dir.appendingPathComponent("data/file1.txt")
           
            do{
                try fileManager.moveItem(at: oldPath, to: newPath)
                print("file moved successfully")
            }catch{
                print("can't move the file")
                print(error.localizedDescription)
            }
        }
    }
    
    func copyFile(){
        //copy file
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let originalFile = dir.appendingPathComponent("file1.txt")
            let copyFile = dir.appendingPathComponent("copy.txt")
            
           
            do{
                try fileManager.copyItem(at: originalFile, to: copyFile)
                print("copied succesfully")
            }catch{
                print("can’t copy")
            }
        }
    }
    func listFile()
    {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        let filePath = url.path
       
        do{
            let list = try fileManager.contentsOfDirectory(atPath: filePath!)
                print(list)
        }catch{
            print("Unable to list")
        }
    }
    func removeFile(){
        //remove file
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let removeFile = dir.appendingPathComponent("copy.txt")
          
            do{
                try fileManager.removeItem(at: removeFile)
                print("removed successfully")
            }catch{
                print("cant remove file…")
            }
        }

    }
    
}


