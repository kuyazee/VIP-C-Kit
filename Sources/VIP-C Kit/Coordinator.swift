//
//  Coordinator.swift
//  CoordinatorSample
//
//  Created by Zonily Jame Pesquera on 28/02/2018.
//

import UIKit

/*
 Thanks to these links:
 - https://www.iamsim.me/the-coordinator-pattern/
 - https://github.com/wtsnz/Coordinator-Example
 - http://khanlou.com/2015/10/coordinators-redux/
 - https://github.com/AndreyPanov/ApplicationCoordinator
 - https://medium.com/blacklane-engineering/coordinators-essential-tutorial-part-i-376c836e9ba7#.hgv4r6y6p
 */

/// A callback function used by coordinators to signal events.
public typealias CoordinatorCallback = (Coordinator) -> Void

public protocol Coordinator: class {

    var childCoordinators: [Coordinator] { get set }

    /// Tells the coordinator to create its
    /// initial view controller and take over the user flow.
    func start(withCallback completion: CoordinatorCallback?)

    /// Tells the coordinator that it is done and that it should
    /// rewind the view controller state to where it was before `start` was called.
    func stop(withCallback completion: CoordinatorCallback?)

    /// Add a child coordinator to the parent
    func add(childCoordinator: Coordinator)

    /// Remove a child coordinator from the parent
    func remove(childCoordinator: Coordinator)

    /// Add a child coordinator to the parent
    /// and then start the flow.
    func add(childCoordinator: Coordinator, andStart completion: CoordinatorCallback?)

    /// Remove a child coordinator from the parent
    /// and the end the flow.
    func remove(childCoordinator: Coordinator, andStop completion: CoordinatorCallback?)
}

public extension Coordinator {

    public func add(childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }

    public func remove(childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
    }

    public func add(childCoordinator: Coordinator, andStart completion: CoordinatorCallback?) {
        self.add(childCoordinator: childCoordinator)
        childCoordinator.start(withCallback: completion)
    }

    public func remove(childCoordinator: Coordinator, andStop completion: CoordinatorCallback?) {
        self.remove(childCoordinator: childCoordinator)
        childCoordinator.stop(withCallback: completion)
    }

}

