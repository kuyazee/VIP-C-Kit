//
// AuthViewController.swift
// FizzBuzzFooBar
//
// Created by Zonily Jame Pesquera on 29/09/2018.
// Copyright © 2018 kuyazee. All rights reserved.
//

import UIKit

protocol AuthViewInput: class {

}

class AuthViewController: UIViewController, AuthViewInput {

    var output: AuthInteractorInput?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
