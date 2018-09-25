//
//  Coordinator+Providers.swift
//  VIP-C Kit
//
//  Created by Zonily Jame Pesquera on 25/09/2018.
//  Copyright © 2018 kuyazee. All rights reserved.
//

import Foundation

/// These are utility overrides for the `start(withCallback: _)`
/// and `stop(withCallback: _)` functions in order to reduce
/// boilerplate codes.

extension Coordinator where Self: PresentingControllerProvider & RootViewControllerProvider {
    public func start(withCallback completion: CoordinatorCallback?) {
        self.presentingViewController.present(self.rootViewController, animated: true) {
            completion?(self)
        }
    }

    public func stop(withCallback completion: CoordinatorCallback?) {
        self.presentingViewController.dismiss(animated: true) {
            completion?(self)
        }
    }
}

extension Coordinator where Self: PresentingControllerProvider & RootViewControllerProvider & NavigationControllerProvider {
    public func start(withCallback completion: CoordinatorCallback?) {
        self.presentingViewController.present(self.navigationController, animated: true) {
            completion?(self)
        }
    }

    public func stop(withCallback completion: CoordinatorCallback?) {
        self.presentingViewController.dismiss(animated: true) {
            completion?(self)
        }
    }
}
