//
// MainCoordinator.swift
// FizzBuzzFooBar
//
// Created by Zonily Jame Pesquera on 24/09/2018.
// Copyright © 2018 kuyazee. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []

    init() {}

    func start(withCallback completion: CoordinatorCallback?) {}

    func stop(withCallback completion: CoordinatorCallback?) {}

}
