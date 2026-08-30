//
//  SplashViewModel.swift
//  PlaceholderApp
//
//  Created by Own on 29/07/2026.
//

import Foundation

class SplashViewModel {

    var onSplashFinished: (() -> Void)?

    func startSplashTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.onSplashFinished?()
        }
    }
}
