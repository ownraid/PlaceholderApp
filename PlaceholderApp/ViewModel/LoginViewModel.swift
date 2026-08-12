//
//  LoginViewModel.swift
//  PlaceholderApp
//
//  Created by Own on 29/07/2026.
//

import Foundation

final class LoginViewModel {

    enum LoginResult {
        case success(LoginUser)
        case emptyFields
        case emptyUsername
        case emptyPassword
        case wrongPassword
        case invalidUsernameOrPassword
    }

    private let userStore = MockUserStore()

    func login(username: String, password: String) -> LoginResult {

        let trimmedUsername = username.trimmingCharacters(in: .whitespacesAndNewlines)

        if trimmedUsername == "" && password.isEmpty {
            return .emptyFields
        }

        if trimmedUsername.isEmpty {
            return .emptyUsername
        }

        if password.isEmpty {
            return .emptyPassword
        }
        
        for user in userStore.user {

            if user.username == trimmedUsername {

                if user.password == password {
                    return .success(user)
                } else {
                    return .wrongPassword
                }

            }

        }

        return .invalidUsernameOrPassword
        
        /*   ask ammar 
        guard let user = userStore.user.first(where: {
            $0.username == trimmedUsername
        }) else {
            return .invalidUsernameOrPassword
        }

        guard user.password == password else {
            return .wrongPassword
        }
         return .success(user)
         */
    }
}
