//
//  LoginViewController.swift
//  PlaceholderApp
//
//  Created by Own on 29/07/2026.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var StackViewBackground: UIView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButtonTapped(_ sender: Any) {
    let result = viewModel.login(username: usernameTextField.text ?? "", password: passwordTextField.text ?? "")
    handleLoginResult(result)
    }
    
    private let viewModel = LoginViewModel()
    private var isPasswordVisible = false

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()

        // Do any additional setup after loading the view.
    }
    
    private func configureUI(){
        passwordTextField.isSecureTextEntry = true
        setupPasswordButton()
    }

    
    private func setupPasswordButton() {

        let eyeButton = UIButton(type: .system)
        eyeButton.setImage(UIImage(systemName: "eye.slash"),for: .normal)
        eyeButton.tintColor = .systemGray
        eyeButton.addTarget(self, action: #selector(passwordButtonTapped), for: .touchUpInside)

        passwordTextField.rightView = eyeButton
        passwordTextField.rightViewMode = .always
    }
    
    @objc
    private func passwordButtonTapped(_ sender: UIButton) {

        isPasswordVisible.toggle()
        passwordTextField.isSecureTextEntry = !isPasswordVisible
        /*
        let imageName : String
        if isPasswordVisible == true{
            imageName = "eye"
        }
        else{
            imageName = "eye.slash"
        }
       */
        let imageName = isPasswordVisible ? "eye" : "eye.slash"
        sender.setImage(UIImage(systemName: imageName), for: .normal)
    }
    

    private func handleLoginResult(_ result: LoginViewModel.LoginResult) {

        resetTextFieldBorders()
        switch result {
            
            case .success(let user):
            navigateToMain(user : user)
            
            case .emptyFields:
                redTextFieldBorder(usernameTextField)
                redTextFieldBorder(passwordTextField)

            case .emptyUsername:
                redTextFieldBorder(usernameTextField)

            case .emptyPassword:
                redTextFieldBorder(passwordTextField)

            case .wrongPassword:
                redTextFieldBorder(passwordTextField)
                showAlert(title: "Login Failed", message: "Password is incorrect")

            case .invalidUsernameOrPassword:
                usernameTextField.layer.borderColor = UIColor.systemRed.cgColor
                passwordTextField.layer.borderColor = UIColor.systemRed.cgColor
                showAlert(title: "Login Failed", message: "Username or Password is incorrect")
        }
    }
    
   private func resetTextFieldBorders() {
        
        //username
        usernameTextField.layer.borderWidth = 1
        usernameTextField.layer.borderColor = UIColor.systemGray4.cgColor
        //password
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.systemGray4.cgColor
        
    }
    
    
    private func redTextFieldBorder(_ textField : UITextField){
        textField.layer.borderColor = UIColor.systemRed.cgColor
    }
    
    private func navigateToMain(user : LoginUser) {
        let mainVC = MainViewController()
        mainVC.username = user.username
        navigationController?.setViewControllers([mainVC], animated: true)

    }
    
    private func showAlert(title: String, message: String) {

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
        
        }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
