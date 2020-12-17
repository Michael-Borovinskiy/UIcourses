//
//  ImagesViewController.swift
//  AuthApp
//
//  Created by Михаил on 11.12.2020.
//

import UIKit

class ImagesViewController: UIViewController {
    
    private let itemsPerRow: CGFloat = 3
    private let sectionInsets = UIEdgeInsets(top: 50.0,
                                             left: 20.0,
                                             bottom: 50.0,
                                             right: 20.0)
    
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
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
