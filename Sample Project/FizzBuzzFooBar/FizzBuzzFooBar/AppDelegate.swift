//
//  AppDelegate.swift
//  FizzBuzzFooBar
//
//  Created by Zonily Jame Pesquera on 14/09/2018.
//  Copyright © 2018 kuyazee. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow()
        self.appCoordinator = AppCoordinator(
            persistenceService: PersistenceService(),
            window: self.window)
        self.appCoordinator.start(withCallback: nil)

        return true
    }


}

