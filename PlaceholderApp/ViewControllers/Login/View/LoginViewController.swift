//
//  LoginViewController.swift
//  PlaceholderApp
//
//  Created by Own on 29/07/2026.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay

final class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let viewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //configureUI()
        bindTextFieldes()
        bindViewModel()
    }
    
    func bindTextFieldes(){
        
        usernameTextField.rx.text.orEmpty
            .bind(to: viewModel.userNameRelay)
            .disposed(by: disposeBag)
        
        passwordTextField.rx.text.orEmpty
            .bind(to: viewModel.passwordRelay)
            .disposed(by: disposeBag)
    }
    
    func bindViewModel(){
        
        let input = LoginViewModel.Input(
            loginTap: loginButton.rx.tap.asObservable()
        )
        let output = viewModel.transform(input: input)
        output.validationResult
            .drive(onNext: { [weak self] result in
                self?.handleLoginResult(result)
            })
            .disposed(by: disposeBag)
        
    }
    private func handleLoginResult(_ result: LoginViewModel.LoginResult) {
        resetTextFieldBorders()
        
        switch result {
        case .success(let user):
            navigateToMain(user: user)
            
        case .emptyFields:
            usernameTextField.error(true)
            passwordTextField.error(true)
            
        case .emptyUsername:
            usernameTextField.error(true)
            
        case .emptyPassword:
            passwordTextField.error(true)
            
        case .wrongPassword:
            passwordTextField.error(true)
            showAlert(title: "Login Failed", message: "Password is incorrect")
            
        case .invalidUsernameOrPassword:
            usernameTextField.error(true)
            passwordTextField.error(true)
            showAlert(title: "Login Failed", message: "Username or Password is incorrect")
        }
    }
    
    
    /*private func configureUI(){
        passwordTextField.isPassword(true)
    }*/
    
    private func resetTextFieldBorders() {
        usernameTextField.error(false)
        passwordTextField.error(false)
    }
    
    /*private func redTextFieldBorder(_ textField: CustomTextField) {
        textField.error(true)
    }*/
    
    private func navigateToMain(user: LoginUser) {
        let mainVC = MainViewController()
        mainVC.username = user.username
        navigationController?.setViewControllers([mainVC], animated: true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
    
    
    
    
    






    
  
    
    /*
     // ------------------ Old Code ( without using customTextField or RxSwift) ------------------
     
     
     @IBAction func loginButtonTapped(_ sender: Any) {
    let result = viewModel.login(username: usernameTextField.text ?? "", password: passwordTextField.text ?? "")
    handleLoginResult(result)
    }
    let disposeBag = DisposeBag()
    private let viewModel = LoginViewModel()
    var userNameRelay = BehaviorRelay<String>(value:"")
    var passwordRelay = BehaviorRelay<String>(value:"")
    func bindTextField(){
        usernameTextField.rx.text.orEmpty
            .bind(to : userNameRelay)
            .disposed(by: disposeBag)
        
        passwordTextField.rx.text.orEmpty
            .bind(to : passwordRelay)
            .disposed(by: disposeBag)
        
    }
    private func bindViewModel() {

        let loginRequest = loginButton.rx.tap
            .withLatestFrom(
                Observable.combineLatest(
                    userNameRelay,
                    passwordRelay
                )
                
            )

        let result = viewModel.login(_ : loginRequest)

        result
            .subscribe(onNext: { [weak self] result in
                self?.handleLoginResult(result)
            })
            .disposed(by: disposeBag)
    }

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
    /*func bindViewModel(){
        let result = viewModel.login(username: usernameTextField.rx.text.orEmpty.asObservable(), password: passwordTextField.rx.text.orEmpty.asObservable())
        
    }*/

    


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }}
    */
 

