//
//  UIStoryboard.swift
//  SwipeRX
//
//  Created by Zonily Jame Pesquera on 28/02/2017.
//
//

import UIKit

// swiftlint:disable identifier_name
enum AppStoryboard: String, AppStoryboardType {
    case Main, Onboarding, FizzBuzz
}

extension UIViewController {
    public static var defaultNibName: String {
        return self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
    }

    static var storyboardIdentifier: String {
        return "\(self)"
    }

    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.instantiate(self)
    }
}
