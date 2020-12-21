//
//  ImagesViewController.swift
//  AuthApp
//
//  Created by Михаил on 11.12.2020.
//

import UIKit

class ImagesViewController: UIViewController {
    
    
    @IBOutlet weak var uiCollectionView: UICollectionView!
    
    var imgFriends: [UIImage]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.uiCollectionView.dataSource = self
        self.uiCollectionView.delegate = self
        
        uiCollectionView.register(UINib(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "imgcell_fromXib")
    }
    
}

extension ImagesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgFriends!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = uiCollectionView.dequeueReusableCell(withReuseIdentifier: "imgcell_fromXib", for: indexPath) as! ImageCell
        cell.setImg(image: imgFriends![indexPath.row])

        return cell
    }
    

}

extension ImagesViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        layout.minimumInteritemSpacing = 03
        layout.minimumLineSpacing = 03
        layout.invalidateLayout()

        return CGSize(width: ((self.view.frame.width/4) - 4), height:((self.view.frame.width / 4) - 4));
    }
}
