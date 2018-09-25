//
//  PersistenceService.swift
//  FizzBuzzFooBar
//
//  Created by Zonily Jame Pesquera on 24/09/2018.
//  Copyright © 2018 kuyazee. All rights reserved.
//

import Foundation

class PersistenceService {

    let userDefaults: UserDefaults

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }

}

// MARK: - PersistenceServiceProtocol
extension PersistenceService: PersistenceServiceProtocol {

    var isFirstLaunch: Bool {
        let isFirstLaunch = !self.userDefaults.bool(forKey: #function)
        if isFirstLaunch {
            self.userDefaults.set(true, forKey: #function)
            self.userDefaults.synchronize()
        }
        return isFirstLaunch
    }

}
