//
//  ImagesViewController.swift
//  AuthApp
//
//  Created by Михаил on 11.12.2020.
//

import UIKit

class ImagesViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let width = UIScreen.main.bounds.size.width // ширина экрана для FlowLayout
    
    @IBOutlet weak var uiCollectionView: UICollectionView!
    
    var user: User?
    var userNum: IndexPath?
    var startImageNum: Int?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.uiCollectionView.dataSource = self
        self.uiCollectionView.delegate = self
        uiCollectionView.register(UINib(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "imgcell_fromXib")
        navigationItem.leftBarButtonItem?.action = #selector(backAction)
    }
    
    @objc func backAction(){

        self.navigationController?.popViewController(animated: true)
        let previousViewController = self.navigationController?.viewControllers.last as! FriendsTableViewController
        previousViewController.userData.user[(user?.id)!] = user!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destination = storyboard.instantiateViewController(identifier: "BlackPhotoSceneForImagesViewController") as! BlackPhotoSceneForImagesViewController
        destination.title = "Фото"
        destination.startImageNum = indexPath.row
        destination.user = user
        navigationController?.pushViewController(destination, animated: true)
    }
    
}

extension ImagesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: DataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (user?.photos.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = uiCollectionView.dequeueReusableCell(withReuseIdentifier: "imgcell_fromXib", for: indexPath) as! ImageCell
        cell.user = user
        cell.indexCell = indexPath.row
        cell.setImg(image: (user?.photos[indexPath.row])!)
        cell.setLikes(countOfLikes: (user?.photoLikes[indexPath.row])!)
        cell.setIsLiked(bool: (user?.isLiked[indexPath.row])!)
        cell.img.isUserInteractionEnabled = true
        return cell
    }
    

}

extension ImagesViewController : UICollectionViewDelegateFlowLayout {
    
    // MARK: FlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 10, left: 3, bottom: 10, right: 3)
        layout.invalidateLayout()

        return CGSize(width: ((width) - 4), height:((width) - 4))
    }
}
