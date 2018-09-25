//
// FizzBuzzInteractor.swift
// FizzBuzzFooBar
//
// Created by Zonily Jame Pesquera on 24/09/2018.
// Copyright © 2018 kuyazee. All rights reserved.
//

import UIKit

protocol FizzBuzzInteractorDelegate: class {

}

protocol FizzBuzzInteractorInput: class {
    func test(number: Int?)

    func alertDismissed()
}


class FizzBuzzInteractor: FizzBuzzInteractorInput {

    var output: FizzBuzzPresenterInput?
    weak var delegate: FizzBuzzInteractorDelegate?

    func test(number: Int?) {
        guard let number = number else {
            self.output?.display(result: .none)
            return
        }

        switch (number % 5 == 0, number % 3 == 0) {
        case (true, true):
            self.output?.display(result: .fizzBuzz)
        case (true, false):
            self.output?.display(result: .buzz)
        case (false, true):
            self.output?.display(result: .fizz)
        case (false, false):
            self.output?.display(result: .none)
        }
    }

    func alertDismissed() {
        self.output?.resetDisplay()
    }
}
