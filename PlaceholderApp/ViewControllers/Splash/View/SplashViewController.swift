//
//  SplashViewController.swift
//  PlaceholderApp
//
//  Created by Own on 29/07/2026.
//

import UIKit
import RxCocoa
import RxSwift

final class SplashViewController: UIViewController {

    let viewModel = SplashViewModel()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
      //  bindViewModel()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timer()

       // viewModel.startSplashTimer()
    }

    /*func bindViewModel() {
        viewModel.onSplashFinished = {
            [weak self] in self?.navigateToLogin()
        }
    }*/
    func timer(){
        Observable.just(())
            .delaySubscription(.seconds(2),scheduler: MainScheduler.instance)
            .asDriver(onErrorDriveWith:.empty() )
            .drive(onNext:{[weak self] in
                self?.navigateToLogin()
            })
            .disposed(by: disposeBag)
    }
    func navigateToLogin() {
        let loginVC = LoginViewController()
        navigationController?.setViewControllers([loginVC], animated: true)
    }


}
