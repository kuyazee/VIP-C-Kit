//
// OnboardingViewController.swift
// FizzBuzzFooBar
//
// Created by Zonily Jame Pesquera on 24/09/2018.
// Copyright © 2018 kuyazee. All rights reserved.
//

import UIKit

protocol OnboardingViewInput: class {

}

class OnboardingViewController: UIViewController, OnboardingViewInput {

    var output: OnboardingInteractorInput?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
