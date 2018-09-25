//
//  AppStoryboardType.swift
//  SwipeRX
//
//  Created by Zonily Jame Pesquera on 26/03/2018.
//

import UIKit

public protocol AppStoryboardType {
    var instance: UIStoryboard { get }

    func instantiate<ViewController: UIViewController>(
        _ viewController: ViewController.Type,
        function: String,
        line: Int,
        file: String) -> ViewController

    func instantiateInitialViewController() -> UIViewController?
}

public extension AppStoryboardType {
    public func instantiateInitialViewController() -> UIViewController? {
        return self.instance.instantiateInitialViewController()
    }
}

public extension AppStoryboardType where Self: RawRepresentable, Self.RawValue == String {
    public var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }

    public func instantiate<ViewController: UIViewController>(
        _ viewController: ViewController.Type,
        function: String = #function,
        line: Int = #line,
        file: String = #file) -> ViewController {

        let storyboardID: String = ViewController.storyboardIdentifier

        guard let viewController = self.instance.instantiateViewController(withIdentifier: storyboardID) as? ViewController else {
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number: \(line) \nFunction: \(function)")
        }

        return viewController
    }

    public func instantiate<ViewController: UIViewController>(
        function: String = #function,
        line: Int = #line,
        file: String = #file) -> ViewController {

        let storyboardID: String = ViewController.storyboardIdentifier

        guard let viewController = self.instance.instantiateViewController(withIdentifier: storyboardID) as? ViewController else {
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number: \(line) \nFunction: \(function)")
        }

        return viewController
    }
}
