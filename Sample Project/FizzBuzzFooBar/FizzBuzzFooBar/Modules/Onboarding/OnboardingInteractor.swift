//
// OnboardingInteractor.swift
// FizzBuzzFooBar
//
// Created by Zonily Jame Pesquera on 24/09/2018.
// Copyright © 2018 kuyazee. All rights reserved.
//

import UIKit

protocol OnboardingInteractorDelegate: class {
    func onboardingInteractorDidFinish(_ onboardingInteractor: OnboardingInteractor)
}

protocol OnboardingInteractorInput: class {
    func userWantsToProceed()

    func proceed()
}


class OnboardingInteractor: OnboardingInteractorInput {

    var output: OnboardingPresenterInput?
    weak var delegate: OnboardingInteractorDelegate?

    func userWantsToProceed() {
        self.output?.showProceedAlert()
    }

    func proceed() {
        self.delegate?.onboardingInteractorDidFinish(self)
    }

}
