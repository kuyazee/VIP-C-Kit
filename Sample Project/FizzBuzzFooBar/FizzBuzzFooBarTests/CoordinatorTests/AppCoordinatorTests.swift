//
//  AppCoordinatorTests.swift
//  FizzBuzzFooBarTests
//
//  Created by Zonily Jame Pesquera on 24/09/2018.
//  Copyright © 2018 kuyazee. All rights reserved.
//

import XCTest
@testable import FizzBuzzFooBar

class AppCoordinatorTests: XCTestCase {

    func test() {
        let mockPersistenceService = MockPersistenceService()
        XCTAssertFalse(mockPersistenceService.didAccessIsFirstLaunchVariable)

        let appCoordinator = MockAppCoordinator(persistenceService: mockPersistenceService, window: nil)
        XCTAssertFalse(appCoordinator.didStart)
        XCTAssertFalse(appCoordinator.didStop)
        XCTAssertFalse(appCoordinator.didStartMainModule)
        XCTAssertFalse(appCoordinator.didStartOnboardingModule)

        appCoordinator.start(withCallback: nil)
        XCTAssert(appCoordinator.didStart)
        XCTAssertFalse(appCoordinator.didStop)
        XCTAssertFalse(appCoordinator.didStartMainModule)
        XCTAssert(appCoordinator.didStartOnboardingModule)
        XCTAssertFalse(mockPersistenceService.isFirstLaunch)
        XCTAssert(mockPersistenceService.didAccessIsFirstLaunchVariable)

        appCoordinator.start(withCallback: nil)
        XCTAssert(appCoordinator.didStart)
        XCTAssertFalse(appCoordinator.didStop)
        XCTAssert(appCoordinator.didStartMainModule)

        appCoordinator.stop(withCallback: nil)
        XCTAssert(appCoordinator.didStop)
    }
    
}
