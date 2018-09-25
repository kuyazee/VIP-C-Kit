//
// FizzBuzzPresenter.swift
// FizzBuzzFooBar
//
// Created by Zonily Jame Pesquera on 24/09/2018.
// Copyright © 2018 kuyazee. All rights reserved.
//

import UIKit

protocol FizzBuzzPresenterInput: class {
    func display(result: FizzBuzzResult)

    func resetDisplay()
}

class FizzBuzzPresenter: FizzBuzzPresenterInput {

    var output: FizzBuzzViewInput?

    func display(result: FizzBuzzResult) {

        let message: String = {
            switch result {
            case .fizz: return "Fizz"
            case .buzz: return "Buzz"
            case .fizzBuzz: return "FizzBuzz"
            case .none: return "Not Applicable"
            }
        }()
        
        self.output?.showAlert(
            withTitle: "Result",
            andMessage: message)

    }

    func resetDisplay() {
        self.output?.resetDisplay()
    }

}
