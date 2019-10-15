//
//  ViewController.swift
//  Imagure_project
//
//  Created by Admin on 25/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var imgurs = [Imgur]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingService.shared.getImgurs{ (response) in
            
            self.imgurs = response.imgurs
            //for loading the data into the cell
            self.collectionView.reloadData()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        imageCache.removeAllObjects()//for cache overloading
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imgurs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImgurCell", for: indexPath) as? ImgurCell else { return UICollectionViewCell() }
        
        cell.configure(with: imgurs[indexPath.item])
        
        return cell
    }

}

