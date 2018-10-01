//
// AuthInteractor.swift
// FizzBuzzFooBar
//
// Created by Zonily Jame Pesquera on 29/09/2018.
// Copyright © 2018 kuyazee. All rights reserved.
//

import UIKit

protocol AuthInteractorDelegate: class {

}

protocol AuthInteractorInput: class {

}


class AuthInteractor: AuthInteractorInput {

    var output: AuthPresenterInput?
    weak var delegate: AuthInteractorDelegate?

}
