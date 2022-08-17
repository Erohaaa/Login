//
//  ViewController.swift
//  HomeWork4
//
//  Created by oleg on 12.05.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Private properties
    private let user = logIn.getUserData()
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        let WelcomeVC = tabBarController.viewControllers?.first as! WelcomeViewController
        let navigationVC = tabBarController.viewControllers?.last as! UINavigationController
        let infoAboutMeVC = navigationVC.topViewController as! infoAboutMe
        WelcomeVC.user = user
        infoAboutMeVC.user = user
    }
    
    // MARK: IBActions
    @IBAction func logInButtonPressed() {
        if loginTextField.text == user.name && passwordTextField.text == user.password {
            return
        } else {showAlert(title: "Введите логин или пароль", message: "")
        }
    }
    
    
    @IBAction func remindLogin() {
        showAlert(title: String("Ваш логин - \(user.name)"), message: "")
    }
    @IBAction func remindPassword() {
        showAlert(title: String("Ваш пароль - \(user.password)"), message: "")

    }
    
    
    
    @IBAction func logOut (segue: UIStoryboardSegue) {
        loginTextField.text = nil
        passwordTextField.text = nil
    }

}
    
// MARK: - Alert Controller
extension LoginViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: Text Field Delegate
extension LoginViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInButtonPressed()
        }
        return true
    }
}

