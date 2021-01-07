//
//  ImagesViewController.swift
//  AuthApp
//
//  Created by Михаил on 11.12.2020.
//

import UIKit

class ImagesViewController: UIViewController {

    
    @IBOutlet weak var uiCollectionView: UICollectionView!
    
    var imgFriends: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.uiCollectionView.dataSource = self
        self.uiCollectionView.delegate = self
    }
    
}

extension ImagesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = uiCollectionView.dequeueReusableCell(withReuseIdentifier: "imgCell", for: indexPath) as! ImageCell
        cell.setImg(str: imgFriends!)
        return cell
    }
    
    
}
