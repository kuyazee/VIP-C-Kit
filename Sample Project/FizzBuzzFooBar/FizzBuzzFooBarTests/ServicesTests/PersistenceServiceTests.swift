//
//  PersistenceServiceTests.swift
//  FizzBuzzFooBarTests
//
//  Created by Zonily Jame Pesquera on 24/09/2018.
//  Copyright © 2018 kuyazee. All rights reserved.
//

import XCTest
@testable import FizzBuzzFooBar

class PersistenceServiceTests: XCTestCase {

    let defaults = UserDefaults(suiteName: "somesuitname")!

    override func tearDown() {
        self.defaults.dictionaryRepresentation().keys.forEach { key in
            self.defaults.removeObject(forKey: key)
        }
        self.defaults.synchronize()
        super.tearDown()
    }

    func test001() {
        let persistenceService = PersistenceService(userDefaults: self.defaults)
        XCTAssert(persistenceService.isFirstLaunch)
        XCTAssertFalse(persistenceService.isFirstLaunch)
    }

    func test002() {
        let persistenceService = MockPersistenceService()
        XCTAssertFalse(persistenceService.didAccessIsFirstLaunchVariable)
        XCTAssert(persistenceService.isFirstLaunch)
        XCTAssert(persistenceService.didAccessIsFirstLaunchVariable)
        XCTAssertFalse(persistenceService.isFirstLaunch)
    }
    
}
