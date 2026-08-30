//
//  SplashViewController.swift
//  PlaceholderApp
//
//  Created by Own on 29/07/2026.
//

import UIKit

final class SplashViewController: UIViewController {

    let viewModel = SplashViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        viewModel.startSplashTimer()
    }

    func bindViewModel() {
        viewModel.onSplashFinished = {
            [weak self] in self?.navigateToLogin()
        }
    }
    func navigateToLogin() {
        let loginVC = LoginViewController()
        navigationController?.setViewControllers([loginVC], animated: true)
    }


}
