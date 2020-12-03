//
//  ViewController.swift
//  AuthApp
//
//  Created by Михаил on 03.12.2020.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        uiViewAuth.layer.cornerRadius = 15;
        uiViewAuth.layer.masksToBounds = true;
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: self.view.window)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: self.view.window)
    }
    
    @IBOutlet weak var uiViewAuth: UIView!
    @IBOutlet weak var loginLbl: UILabel!
    @IBOutlet weak var pswdLbl: UILabel!
    @IBAction func loginTxtField(_ sender: Any) {
    }
    @IBAction func pswdTxtField(_ sender: Any) {
    }
    @IBAction func cancelBtn(_ sender: Any) {
    }
    @IBAction func enterBtn(_ sender: Any) {
    }
    

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height - 120
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

}

