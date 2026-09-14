//
//  LoginViewModel.swift
//  PlaceholderApp
//
//  Created by Own on 29/07/2026.
//

import Foundation
import RxSwift
import RxCocoa
import RxRelay

class LoginViewModel {

    let userStore = MockUserStore()
    let userNameRelay = BehaviorRelay<String>(value: "")
    let passwordRelay = BehaviorRelay<String>(value: "")

    enum LoginResult {
        case success(LoginUser)
        case emptyFields
        case emptyUsername
        case emptyPassword
        case wrongPassword
        case invalidUsernameOrPassword
    }

    struct Input {
        //let usernameRelay: BehaviorRelay<String>
        //let passwordRelay: BehaviorRelay<String>
        let loginTap: Observable<Void>
    }

    struct Output {
        let validationResult: Driver<LoginResult>
    }

    func transform(input: Input) -> Output {
            let result = input.loginTap
                .map { [weak self] _ -> LoginResult in
                    guard let self = self else { return .invalidUsernameOrPassword }
                    
                   
                    let username = userNameRelay.value
                    let password = passwordRelay.value
                    let trimmedUsername = username.trimmingCharacters(in: .whitespacesAndNewlines)
                    
                    if trimmedUsername.isEmpty && password.isEmpty {
                        return .emptyFields
                    }
                    if trimmedUsername.isEmpty {
                        return .emptyUsername
                    }
                    if password.isEmpty {
                        return .emptyPassword
                    }
                    
                    for user in self.userStore.user {
                        if user.username == trimmedUsername {
                            if user.password == password {
                                return .success(user)
                            } else {
                                return .wrongPassword
                            }
                        }
                    }
                    
                    
                    return .invalidUsernameOrPassword
                }
            
            return Output(
                validationResult: result.asDriver(onErrorJustReturn: .invalidUsernameOrPassword)
            )
        }
}
