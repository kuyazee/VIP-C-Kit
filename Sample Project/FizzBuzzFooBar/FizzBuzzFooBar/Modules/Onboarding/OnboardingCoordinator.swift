//
// OnboardingCoordinator.swift
// FizzBuzzFooBar
//
// Created by Zonily Jame Pesquera on 24/09/2018.
// Copyright © 2018 kuyazee. All rights reserved.
//

import UIKit

protocol OnboardingCoordinatorDelegate: class {
    func onboardingCoordinatorDidFinish(_ onboardingCoordinator: OnboardingCoordinator)
}

class OnboardingCoordinator: Coordinator, PresentingControllerProvider, RootViewControllerProvider {

    var childCoordinators: [Coordinator] = []

    var presentingViewController: UIViewController
    lazy var rootViewController: UIViewController = self.createOnboardingViewController()

    weak var delegate: OnboardingCoordinatorDelegate?

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

extension OnboardingCoordinator: OnboardingInteractorDelegate {
    func createOnboardingViewController() -> OnboardingViewController {
        let viewController = AppStoryboard.Onboarding
            .instantiate(OnboardingViewController.self)
        let interactor = OnboardingInteractor()
        let presenter = OnboardingPresenter()

        viewController.output = interactor
        interactor.output = presenter
        presenter.output = viewController
        interactor.delegate = self

        return viewController
    }
}
