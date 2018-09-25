//
// AppCoordinator.swift
// FizzBuzzFooBar
//
// Created by Zonily Jame Pesquera on 24/09/2018.
// Copyright © 2018 kuyazee. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator, RootViewControllerProvider {

    var childCoordinators: [Coordinator] = []
    var window: UIWindow?
    var rootViewController: UIViewController = UIViewController()
    let persistenceService: PersistenceServiceProtocol

    init(persistenceService: PersistenceServiceProtocol, window: UIWindow?) {
        self.persistenceService = persistenceService
        self.window = window
    }

    func start(withCallback completion: CoordinatorCallback?) {
        self.window?.rootViewController = self.rootViewController
        self.window?.makeKeyAndVisible()

        if self.persistenceService.isFirstLaunch {
            self.startOnboardingModule(withCallback: completion)
        } else {
            self.startMainModule(withCallback: completion)
        }
    }

    func stop(withCallback completion: CoordinatorCallback?) {
        self.window?.rootViewController = nil
        self.window?.makeKeyAndVisible()
    }

    func startOnboardingModule(withCallback completion: CoordinatorCallback?) {
        let onboardingCoordinator = OnboardingCoordinator(presentingViewController: self.rootViewController)
        onboardingCoordinator.delegate = self
        self.add(childCoordinator: onboardingCoordinator, andStart: completion)
    }

    func startMainModule(withCallback completion: CoordinatorCallback?) {
        let fizzBuzzCoordinator = FizzBuzzCoordinator(presentingViewController: self.rootViewController)
        self.add(childCoordinator: fizzBuzzCoordinator, andStart: completion)
    }

}

// MARK: - OnboardingCoordinatorDelegate
extension AppCoordinator: OnboardingCoordinatorDelegate {

    func onboardingCoordinatorDidFinish(_ onboardingCoordinator: OnboardingCoordinator) {
        self.remove(childCoordinator: onboardingCoordinator) { onboardingCoordinator in
            self.startMainModule(withCallback: nil)
        }
    }

}
