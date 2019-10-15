//
//  ViewController.swift
//  swiftFileManager
//
//  Created by Admin on 09/10/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var fileManager = FileManager()
    var tmpdir = NSTemporaryDirectory()
    let filename = "Sample.txt"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func enumerateDirectory() -> String? {
       // var error: NSError?
        do{
        let filesInDirectory = try fileManager.contentsOfDirectory(atPath: tmpdir) as? [String]
       
        if let files = filesInDirectory {
            if files.count > 0 {
                if files[0] == filename {
                    print("sample.txt found")
                    return files[0]
                } else {
                    print("File not found")
                    return nil
                }
            }
        }
        }catch{
            print("Failed !")
        }
        return nil
    }
    
    

    @IBAction func createFile(_ sender: Any) {
       // let path = tmpdir.appendingPathComponent(filename)
        let writePath = NSURL(fileURLWithPath: tmpdir).appendingPathComponent(filename)
        print(writePath!)
        let contentsOfFile="Hey How are you"
        do {
            try contentsOfFile.write(to: writePath!, atomically: false, encoding: .utf8)
        }
        catch {/* error handling here */}

       
        
    }
    
    @IBAction func lestDirs(_ sender: Any) {
        let isFileInDir = enumerateDirectory() ?? "Empty"
        print("Contents of Directory =  \(isFileInDir)")
    }
    
    @IBAction func ViewFileContent(_ sender: Any) {
        
        let isFileInDir = enumerateDirectory() ?? ""
        
        let path = NSURL(fileURLWithPath: tmpdir).appendingPathComponent(isFileInDir)
        
        do{
            let contentsOfFile = try NSString(contentsOf: path!, encoding: String.Encoding.utf32.rawValue)
       
        // let content = contentsOfFile
            print("Content of file = \(contentsOfFile)")
    
         }catch{
               print("failed")
               }
}
    
    @IBAction func Delete(_ sender: Any) {

        if let isFileInDir = enumerateDirectory() {
            let path = NSURL(fileURLWithPath: tmpdir).appendingPathComponent(isFileInDir)
            
            do{
                try fileManager.removeItem(at: path!)
            }catch{
                print("unable to remove")
            }
        } else {
            print("No file found")
        }
    }
    
}

