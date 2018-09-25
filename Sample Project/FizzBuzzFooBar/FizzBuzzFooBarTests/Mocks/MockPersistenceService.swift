//
//  MockPersistenceService.swift
//  FizzBuzzFooBarTests
//
//  Created by Zonily Jame Pesquera on 24/09/2018.
//  Copyright © 2018 kuyazee. All rights reserved.
//

import Foundation
@testable import FizzBuzzFooBar

class MockPersistenceService: PersistenceServiceProtocol {

    var didAccessIsFirstLaunchVariable: Bool = false

    fileprivate var isFirstLaunchContainer: Bool = false
    fileprivate var isFirstLaunchAccessCount: Int = 0

    var isFirstLaunch: Bool {
        self.didAccessIsFirstLaunchVariable = true
        if self.isFirstLaunchAccessCount == 0 {
            self.isFirstLaunchAccessCount += 1
            return true
        } else {
            self.isFirstLaunchAccessCount += 1
            return false
        }
//        let isFirstLaunch = !self.isFirstLaunchContainer
//        print(#function, isFirstLaunch)
//        if isFirstLaunch {
//            self.isFirstLaunchContainer = true
//        }
//        print(#function, isFirstLaunch)
//        return isFirstLaunch
    }
}
