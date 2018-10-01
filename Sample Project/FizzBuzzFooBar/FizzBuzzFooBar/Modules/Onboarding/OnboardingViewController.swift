//
// OnboardingViewController.swift
// FizzBuzzFooBar
//
// Created by Zonily Jame Pesquera on 24/09/2018.
// Copyright © 2018 kuyazee. All rights reserved.
//

import UIKit

protocol OnboardingViewInput: class {
    func showAlert(withTitle title: String, andMessage message: String)
}

class OnboardingViewController: UIViewController, OnboardingViewInput {

    var output: OnboardingInteractorInput?
    @IBOutlet weak var proceedButton: UIButton!
    
    @IBAction func proceedButtonClicked(_ sender: Any?) {
        self.output?.userWantsToProceed()
    }

    func showAlert(withTitle title: String, andMessage message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        alertController.addAction(UIAlertAction(
            title: "Ok",
            style: .default,
            handler: { _ in
                self.output?.proceed()
        }))
        self.present(alertController, animated: true, completion: nil)
    }


}
