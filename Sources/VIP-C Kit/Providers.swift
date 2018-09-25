//
//  Providers.swift
//  SampleMoneyManager
//
//  Created by Zonily Jame Pesquera on 09/09/2018.
//  Copyright © 2018 Zonily Jame Pesquera. All rights reserved.
//

import UIKit

public protocol RootViewControllerProvider: class {
    associatedtype RootViewController where RootViewController: UIViewController

    /// The coordinators `rootViewController`. It helps to think of this as the view
    /// controller that can be used to dismiss the coordinator from the view hierarchy.
    var rootViewController: RootViewController { get }
}

public protocol NavigationControllerProvider: class {
    associatedtype NavigationController where NavigationController: UINavigationController

    /// The coordinators `navigationController`. It helps to think of this as the view
    /// controller handling push and pop, this is also the controller that can be used to
    /// dismiss the coordinator from the view hierarchy.
    var navigationController: NavigationController { get }
}

public protocol PresentingControllerProvider: class {
    associatedtype PresentingViewController where PresentingViewController: UIViewController

    /// The coordinator`s `presentingViewController`. It helps to think of this
    /// as the view that will present any kind of `UIViewController`.
    var presentingViewController: PresentingViewController { get set }
}
