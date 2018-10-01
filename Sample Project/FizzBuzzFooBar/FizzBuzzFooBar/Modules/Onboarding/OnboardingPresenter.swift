//
// OnboardingPresenter.swift
// FizzBuzzFooBar
//
// Created by Zonily Jame Pesquera on 24/09/2018.
// Copyright © 2018 kuyazee. All rights reserved.
//

import UIKit

protocol OnboardingPresenterInput: class {
    func showProceedAlert()
}

class OnboardingPresenter: OnboardingPresenterInput {

    var output: OnboardingViewInput?

    func showProceedAlert() {
        self.output?.showAlert(
            withTitle: "Are you really sure you want to proceed?",
            andMessage: "You will never see this view ever again.")
    }

}
