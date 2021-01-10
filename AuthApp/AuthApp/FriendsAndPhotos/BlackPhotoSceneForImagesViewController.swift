//
//  BlackPhotoSceneForImagesViewController.swift
//  AuthApp
//
//  Created by Михаил on 01.01.2021.
//

import UIKit

class BlackPhotoSceneForImagesViewController: UIViewController {

    var user: User?
    var imagewidth: CGFloat?
    var currentImageNum = 0
    @IBOutlet weak var uiImageView: UIImageView!
    @IBOutlet weak var centerConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiImageView.translatesAutoresizingMaskIntoConstraints = false
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.uiImageView.image = (self.user?.photos[self.currentImageNum])
    }
    
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

         if let swipeGesture = gesture as? UISwipeGestureRecognizer {
             imagewidth = self.uiImageView.frame.width

             switch swipeGesture.direction {
             case UISwipeGestureRecognizer.Direction.left:
                if self.currentImageNum == (self.user?.photos.count)! - 1 {
                     self.currentImageNum = 0
                 }else{
                     self.currentImageNum += 1

                 }
                 
                 UIView.animate(withDuration: 0.2, delay: 0.0, options: [], animations: {
                     self.centerConstraint.constant -= self.imagewidth!
                     self.uiImageView.layer.opacity = 0.0
                     self.uiImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5);
                     self.view.layoutIfNeeded()
                 }, completion: {_ in
                     UIView.animate(withDuration: 0.01, delay: 0.0, options: [], animations: {
                         self.centerConstraint.constant += self.imagewidth!*2
                                     self.view.layoutIfNeeded()},completion: {_ in
                                         UIView.animate(withDuration: 0.2, delay: 0.0, options: [], animations:  {
                                             self.centerConstraint.constant -= self.imagewidth!
                                             self.view.layoutIfNeeded()
                                             self.uiImageView.image = self.user?.photos[self.currentImageNum]
                                             self.uiImageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0);
                                             self.uiImageView.layer.opacity = 1.0})
                     })
                 })

             case UISwipeGestureRecognizer.Direction.right:
                 if currentImageNum == 0 {
                    currentImageNum = (self.user?.photos.count)! - 1
                 }else{
                     currentImageNum -= 1
                 }
                 
                 UIView.animate(withDuration: 0.2, delay: 0.0, options: [], animations: {
                     self.centerConstraint.constant += self.imagewidth!
                     self.uiImageView.layer.opacity = 0.0
                     self.uiImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5);
                     self.view.layoutIfNeeded()
                       
                 }, completion: {_ in
                     UIView.animate(withDuration: 0.01, delay: 0.0, options: [], animations: {
                         self.centerConstraint.constant -= self.imagewidth!*2
                                     self.view.layoutIfNeeded()},completion: {_ in
                                         UIView.animate(withDuration: 0.2, delay: 0.0, options: [], animations:  {
                                             self.centerConstraint.constant += self.imagewidth!
                                             self.view.layoutIfNeeded()
                                             self.uiImageView.image = self.user?.photos[self.currentImageNum]
                                             self.uiImageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0);
                                             self.uiImageView.layer.opacity = 1.0})
                     })
                 })
                 
             default:
                 break
             }
         }
    }
     override func didReceiveMemoryWarning() {
         super.didReceiveMemoryWarning()
         // Dispose of any resources that can be recreated.
     }
    
    
    
    

}
