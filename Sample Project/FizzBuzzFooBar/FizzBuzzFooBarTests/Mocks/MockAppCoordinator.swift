//
//  MockAppCoordinator.swift
//  FizzBuzzFooBarTests
//
//  Created by Zonily Jame Pesquera on 24/09/2018.
//  Copyright © 2018 kuyazee. All rights reserved.
//

import Foundation
@testable import FizzBuzzFooBar

class MockAppCoordinator: AppCoordinator {

    var didStart: Bool = false
    var didStop: Bool = false
    var didStartOnboardingModule: Bool = false
    var didStartMainModule: Bool = false

    override func start(withCallback completion: CoordinatorCallback?) {
        super.start(withCallback: completion)
        self.didStart = true
    }

    override func stop(withCallback completion: CoordinatorCallback?) {
        super.start(withCallback: completion)
        self.didStop = true
    }

    override func startOnboardingModule(withCallback completion: CoordinatorCallback?) {
        super.startOnboardingModule(withCallback: completion)
        self.didStartOnboardingModule = true
    }

    override func startMainModule(withCallback completion: CoordinatorCallback?) {
        super.startMainModule(withCallback: completion)
        self.didStartMainModule = true
    }
}
