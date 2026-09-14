//
//  ErrorStateTextField.swift
//  PlaceholderApp
//
//  Created by Own on 13/09/2026.
//

import UIKit
@IBDesignable
class CustomTextField: UITextField {
    var errorState : Bool = false
    var isPasswordVisible: Bool = false
    
    @IBInspectable
    var borderWidth: CGFloat = 1 {
        didSet {
            updateAppearance()
        }
    }
    @IBInspectable
    var redBorderColor: UIColor = .systemRed
    @IBInspectable
    var grayBorderColor: UIColor = .systemGray
    
    @IBInspectable
    var PasswordField: Bool = false {
        didSet {
            updateAppearance()
        }
    }
    func updateAppearance(){
        layer.borderWidth = borderWidth
        layer.borderColor = (errorState ? redBorderColor : grayBorderColor).cgColor
        isPassword(PasswordField)
        
    }
    
    func error(_ state : Bool){
        errorState = state
        updateAppearance()
        
    }
    
    func isPassword(_ state: Bool) {
        isSecureTextEntry = state
        isPasswordVisible = false
        guard state else {
            rightView = nil
            rightViewMode = .never
            return
        }
        let eyeButton = UIButton(type: .system)
        eyeButton.setImage(UIImage(systemName: "eye.slash"),for: .normal)
        eyeButton.tintColor = .systemGray

        eyeButton.addTarget(self,action: #selector(passwordButtonTapped(_:)),for: .touchUpInside)
        rightView = eyeButton
        rightViewMode = .always
    }

    @objc
    func passwordButtonTapped(_ sender: UIButton) {
        isPasswordVisible.toggle()
        isSecureTextEntry = !isPasswordVisible
        let imageName = isPasswordVisible ? "eye" : "eye.slash"
        sender.setImage(UIImage(systemName: imageName),for: .normal)
    }
}
