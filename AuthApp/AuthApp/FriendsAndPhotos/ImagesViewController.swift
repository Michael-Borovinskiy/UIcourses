//
//  ImagesViewController.swift
//  AuthApp
//
//  Created by Михаил on 11.12.2020.
//

import UIKit

class ImagesViewController: UIViewController {
    
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    @IBOutlet weak var uiCollectionView: UICollectionView!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.uiCollectionView.dataSource = self
        self.uiCollectionView.delegate = self
        
        uiCollectionView.register(UINib(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "imgcell_fromXib")
    }
    
}

extension ImagesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (user?.photos.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = uiCollectionView.dequeueReusableCell(withReuseIdentifier: "imgcell_fromXib", for: indexPath) as! ImageCell
        cell.setImg(image: (user?.photos[indexPath.row])!)
        cell.setLikes(countOfLikes: (user?.photoLikes[indexPath.row])!)
        return cell
    }
    

}

extension ImagesViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 10, left: 3, bottom: 10, right: 3)
        layout.invalidateLayout()

        return CGSize(width: ((width) - 4), height:((width) - 4))//CGSize(width: ((self.view.frame.width/4) - 4), height:((self.view.frame.width / 4) - 4));
    }
}
