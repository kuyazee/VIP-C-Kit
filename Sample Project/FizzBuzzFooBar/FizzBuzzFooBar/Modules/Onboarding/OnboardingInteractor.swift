//
// OnboardingInteractor.swift
// FizzBuzzFooBar
//
// Created by Zonily Jame Pesquera on 24/09/2018.
// Copyright © 2018 kuyazee. All rights reserved.
//

import UIKit

protocol OnboardingInteractorDelegate: class {

}

protocol OnboardingInteractorInput: class {

}


class OnboardingInteractor: OnboardingInteractorInput {

    var output: OnboardingPresenterInput?
    weak var delegate: OnboardingInteractorDelegate?

}
