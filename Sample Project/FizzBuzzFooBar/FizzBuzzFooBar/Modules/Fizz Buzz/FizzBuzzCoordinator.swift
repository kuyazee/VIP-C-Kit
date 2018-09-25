//
// FizzBuzzCoordinator.swift
// FizzBuzzFooBar
//
// Created by Zonily Jame Pesquera on 24/09/2018.
// Copyright © 2018 kuyazee. All rights reserved.
//

import UIKit

class FizzBuzzCoordinator: Coordinator, PresentingControllerProvider, RootViewControllerProvider {

    var childCoordinators: [Coordinator] = []
    var presentingViewController: UIViewController
    lazy var rootViewController: UIViewController = self.createFizzBuzzViewController()

    init(presentingViewController: UIViewController) {
        self.presentingViewController = presentingViewController
    }

    func start(withCallback completion: CoordinatorCallback?) {
        self.presentingViewController.present(self.rootViewController, animated: true) {
            completion?(self)
        }
    }

    func stop(withCallback completion: CoordinatorCallback?) {
        self.presentingViewController.dismiss(animated: true) {
            completion?(self)
        }
    }

}

extension FizzBuzzCoordinator: FizzBuzzInteractorDelegate {
    func createFizzBuzzViewController() -> FizzBuzzViewController {
        let viewController = AppStoryboard.FizzBuzz.instantiate(FizzBuzzViewController.self)
        let interactor = FizzBuzzInteractor()
        let presenter = FizzBuzzPresenter()

        viewController.output = interactor
        interactor.output = presenter
        presenter.output = viewController
        interactor.delegate = self

        return viewController
    }
}
