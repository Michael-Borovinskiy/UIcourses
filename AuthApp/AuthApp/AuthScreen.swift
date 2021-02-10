//
//  ViewController.swift
//  AuthApp
//
//  Created by Михаил on 03.12.2020.
//

import UIKit


class AuthScreen: UIViewController {
    
    
    let loginText: String = "root"
    let pswdTexr: String = "root"
    var uiViewWhiteScreen: UIView? = UIView()
    
    
    @IBOutlet weak var uiViewAuth: UIView!
    @IBOutlet weak var loginLbl: UILabel!
    @IBOutlet weak var pswdLbl: UILabel!
    @IBOutlet weak var loginTxtFieldArea: UITextField!
    @IBOutlet weak var pswdTxtFieldArea: UITextField!
    @IBOutlet weak var centerVerticalFormContraint: NSLayoutConstraint!
    @IBOutlet weak var imgVk: UIImageView!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var downMoveButton: UIButton!
    
    
    @IBAction func loginTxtField(_ sender: UITextField) {
    }
    @IBAction func pswdTxtField(_ sender: UITextField) {
    }
    @IBAction func cancelBtn(_ sender: Any) {
    }
    @IBAction func enterBtn(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiViewAuth.layer.cornerRadius = 15;
        uiViewAuth.layer.masksToBounds = true;
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        self.view.addGestureRecognizer(tap)
        self.downMoveButton.addTarget(self, action: #selector(downInViewAuth), for: .touchUpInside)
        self.cancelButton.addTarget(self, action: #selector(clearTextFields), for: .touchUpInside)
        self.imgVk.rotate()
        setWhiteScreenDefault()
        
    }
    
    @objc func tapAction() {
        view.endEditing(true)
    }
    
    @objc func downInViewAuth() {
        UIView.animate(withDuration: 0.3) {
            self.centerVerticalFormContraint.constant = -self.uiViewAuth.frame.height/3
            self.view.layoutIfNeeded()
        }
    }
    
    // MARK: Keyboard
    
    @objc func keyboardWillShow(_ notification: Notification?) {
        
        if let keyboardFrame: NSValue = notification?.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            // Достаем CGRect клавиатуры
            let keyboardRectangle = keyboardFrame.cgRectValue
            // Из объекта CGRect получаем высоту клавиатуры
            let keyboardHeight = keyboardRectangle.height
            raiseFormView(to: keyboardHeight)
            UIView.animate(withDuration: 0.2, animations: {self.imgVk.layer.opacity = 0})
            }
        self.downMoveButton.isHidden = false
        }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: 0.3) {
            // Присваиваем констрейнту значение 0 (оно стояло по умолчанию) - это переместит
            // formContainerView обратно, в центр экрана
            self.centerVerticalFormContraint.constant = 0
            // Нужно вызвать, чтобы анимация заработала (только для анимирования contraint'ов)
            self.view.layoutIfNeeded()
            self.imgVk.layer.opacity = 1
        }
        self.downMoveButton.isHidden = true
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
    
    @objc func clearTextFields () {
        self.loginTxtFieldArea.text = ""
        self.pswdTxtFieldArea.text = ""
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//       if !isApproved () {           //закомментировано для быстрого доступа при проверке ДЗ
//            let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
//            // Создаем кнопку для UIAlertController
//            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//            // Добавляем кнопку на UIAlertController
//            alert.addAction(action)
//            // Показываем UIAlertController
//            present(alert, animated: true, completion: nil)
//            loginTxtFieldArea.text = ""
//            pswdTxtFieldArea.text = ""
       //}else{
        Session.instance.setUserData(userIdStr: 1, tokenStr: "1ygeSeddwgy:Cw34t4uhfsas:5hGDDkfhwg")
        UIView.animate(withDuration: 0.2, animations: { [self] in  //  cкрытие экрана авторизации для кастомного перехода между экранами (черный фон)
            self.view = self.uiViewWhiteScreen
            uiViewWhiteScreen!.layer.opacity = 1
        })
        return true

//       }
//        return false
    }
    
    deinit {
        removeKBNotification()
    }
    
    
    func removeKBNotification () {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: self.view.window)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: self.view.window)
    }
    
    
    func setWhiteScreenDefault() {
        uiViewWhiteScreen = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width,height: view.frame.height))
        uiViewWhiteScreen!.backgroundColor = .white
        uiViewWhiteScreen!.bounds = self.view.bounds
        uiViewWhiteScreen!.layer.opacity = 0
    }
    
    // MARK: Portrait Orientation
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait
        }
    }
}

    // MARK: Animation

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

