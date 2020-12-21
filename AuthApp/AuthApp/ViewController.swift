//
//  ViewController.swift
//  AuthApp
//
//  Created by Михаил on 03.12.2020.
//

import UIKit


class ViewController: UIViewController {
    
    
    let loginText: String = "root"
    let pswdTexr: String = "root"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiViewAuth.layer.cornerRadius = 15;
        uiViewAuth.layer.masksToBounds = true;
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        self.view.addGestureRecognizer(tap)
        self.imgVk.rotate()
    }
    

    
    @IBOutlet weak var uiViewAuth: UIView!
    @IBOutlet weak var loginLbl: UILabel!
    @IBOutlet weak var pswdLbl: UILabel!
    @IBOutlet weak var loginTxtFieldArea: UITextField!
    @IBOutlet weak var pswdTxtFieldArea: UITextField!
    @IBOutlet weak var centerVerticalFormContraint: NSLayoutConstraint!
    @IBOutlet weak var imgVk: UIImageView!
    
    
    @IBAction func loginTxtField(_ sender: UITextField) {
    }
    @IBAction func pswdTxtField(_ sender: UITextField) {
    }
    @IBAction func cancelBtn(_ sender: Any) {
    }
    @IBAction func enterBtn(_ sender: Any) {
    }
    
    @objc func tapAction() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(_ notification: Notification?) {
        
        if let keyboardFrame: NSValue = notification?.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            // Достаем CGRect клавиатуры
            let keyboardRectangle = keyboardFrame.cgRectValue
            // Из объекта CGRect получаем высоту клавиатуры
            let keyboardHeight = keyboardRectangle.height
            raiseFormView(to: keyboardHeight)
            }
        }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: 0.3) {
            // Присваиваем констрейнту значение 0 (оно стояло по умолчанию) - это переместит
            // formContainerView обратно, в центр экрана
            self.centerVerticalFormContraint.constant = 0
            // Нужно вызвать, чтобы анимация заработала (только для анимирования contraint'ов)
            self.view.layoutIfNeeded()
        }
    }
    
    func raiseFormView(to height: CGFloat) {
        let formMaxY = uiViewAuth.frame.maxY
        let currentViewHeight = self.view.frame.height - height
        let moveDistance = (formMaxY - currentViewHeight) + 30
        UIView.animate(withDuration: 0.3) {
            self.centerVerticalFormContraint.constant = -moveDistance
            self.view.layoutIfNeeded()
        }
    }

    func isApproved ()-> Bool {
        return loginTxtFieldArea.text == loginText && pswdTxtFieldArea.text == pswdTexr
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        if !isApproved () {           //закомментировано для быстрого доступа при проверке ДЗ
//            let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
//            // Создаем кнопку для UIAlertController
//            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//            // Добавляем кнопку на UIAlertController
//            alert.addAction(action)
//            // Показываем UIAlertController
//            present(alert, animated: true, completion: nil)
//            loginTxtFieldArea.text = ""
//            pswdTxtFieldArea.text = ""
//        }
        return true
    }
    
    deinit {
        removeKBNotification()
    }
    
    
    func removeKBNotification () {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: self.view.window)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: self.view.window)
    }
    
}


extension UIView{ // добавление функции вращения логотипа
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 0.5
        rotation.isCumulative = true
        rotation.repeatCount = 1.0
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}

