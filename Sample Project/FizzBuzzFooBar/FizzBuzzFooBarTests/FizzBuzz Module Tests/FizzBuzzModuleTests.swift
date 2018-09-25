//
//  FizzBuzzModuleTests.swift
//  FizzBuzzFooBarTests
//
//  Created by Zonily Jame Pesquera on 24/09/2018.
//  Copyright © 2018 kuyazee. All rights reserved.
//

import XCTest
@testable import FizzBuzzFooBar

class FizzBuzzModuleTests: XCTestCase {

    class MockFizzBuzzViewInput: FizzBuzzViewInput {
        private(set) var didCallShowAlert: Bool = false
        private(set) var didCallResetDisplay: Bool = false
        private(set) var passedShowAlertValue: (title: String, message: String)?
        init() {}

        func showAlert(withTitle title: String, andMessage message: String) {
            self.didCallShowAlert = true
            self.passedShowAlertValue = (title, message)
        }

        func resetDisplay() {
            self.didCallResetDisplay = true
        }
    }

    class MockFizzBuzzInteractorInput: FizzBuzzInteractorInput {
        private(set) var didCallTestNumber: Bool = false
        private(set) var didCallAlertDismissed: Bool = false
        private(set) var passedTestNumber: Int?

        init() {}

        func test(number: Int?) {
            self.didCallTestNumber = true
            self.passedTestNumber = number
        }

        func alertDismissed() {
            self.didCallAlertDismissed = true
        }
    }

    class MockFizzBuzzPresenterInput: FizzBuzzPresenterInput {
        private(set) var didCallDisplayResult: Bool = false
        private(set) var didCallResetDisplay: Bool = false
        private(set) var passedDisplayResult: FizzBuzzResult? = nil

        init() {}

        func display(result: FizzBuzzResult) {
            self.didCallDisplayResult = true
            self.passedDisplayResult = result
        }

        func resetDisplay() {
            self.didCallResetDisplay = true
        }
    }

    /// Send actions from the Interactor to Test the Mock Output
    func testInteractor() {
        let mockOutput = MockFizzBuzzPresenterInput()
        let interactor = FizzBuzzInteractor()
        interactor.output = mockOutput

        XCTAssertFalse(mockOutput.didCallDisplayResult)
        XCTAssertFalse(mockOutput.didCallResetDisplay)
        XCTAssertNil(mockOutput.passedDisplayResult)

        interactor.test(number: nil)
        XCTAssert(mockOutput.didCallDisplayResult)
        XCTAssertNotNil(mockOutput.passedDisplayResult)
        if let passedDisplayResult = mockOutput.passedDisplayResult {
            XCTAssert(passedDisplayResult == .none)
        } else {
            XCTFail()
        }

        interactor.test(number: 2)
        XCTAssert(mockOutput.didCallDisplayResult)
        XCTAssertNotNil(mockOutput.passedDisplayResult)
        if let passedDisplayResult = mockOutput.passedDisplayResult {
            XCTAssert(passedDisplayResult == .none)
        } else {
            XCTFail()
        }

        interactor.test(number: 3)
        XCTAssert(mockOutput.passedDisplayResult == .fizz)

        interactor.test(number: 5)
        XCTAssert(mockOutput.passedDisplayResult == .buzz)

        interactor.test(number: 15)
        XCTAssert(mockOutput.passedDisplayResult == .fizzBuzz)

        interactor.alertDismissed()
        XCTAssert(mockOutput.didCallResetDisplay)
    }

    /// Send actions from the View to Test the Mock Output
    func testView() {
        let mockOutput = MockFizzBuzzInteractorInput()
        let viewController = AppStoryboard.FizzBuzz.instantiate(FizzBuzzViewController.self)
        _ = viewController.view
        viewController.output = mockOutput

        XCTAssertFalse(mockOutput.didCallTestNumber)
        XCTAssertFalse(mockOutput.didCallAlertDismissed)
        XCTAssertNil(mockOutput.passedTestNumber)

        viewController.testButtonClicked(nil)
        XCTAssert(mockOutput.didCallTestNumber)

        viewController.showAlert(withTitle: "", andMessage: "")
        // false because the "Ok" button cannot be clicked
        // therefore the alert cannot be dismissed.
        XCTAssertFalse(mockOutput.didCallAlertDismissed)
    }

    /// Send actions from the Presenter to Test the Mock Output
    func testPresenter() {
        let mockOutput = MockFizzBuzzViewInput()
        let presenter = FizzBuzzPresenter()
        presenter.output = mockOutput

        XCTAssertFalse(mockOutput.didCallShowAlert)
        XCTAssertFalse(mockOutput.didCallResetDisplay)
        XCTAssertNil(mockOutput.passedShowAlertValue)

        presenter.display(result: .fizz)
        XCTAssert(mockOutput.didCallShowAlert)
        XCTAssertNotNil(mockOutput.passedShowAlertValue)
        XCTAssert((mockOutput.passedShowAlertValue ?? ("","")) == ("Result", "Fizz"))

        presenter.display(result: .buzz)
        XCTAssert((mockOutput.passedShowAlertValue ?? ("","")) == ("Result", "Buzz"))

        presenter.display(result: .fizzBuzz)
        XCTAssert((mockOutput.passedShowAlertValue ?? ("","")) == ("Result", "FizzBuzz"))

        presenter.display(result: .none)
        XCTAssert((mockOutput.passedShowAlertValue ?? ("","")) == ("Result", "Not Applicable"))

        presenter.resetDisplay()
        XCTAssert(mockOutput.didCallResetDisplay)

    }

    /// Send actions from the View-Interactor to Test the Mock Output
    func testViewInteractor() {
        let viewController = AppStoryboard.FizzBuzz.instantiate(FizzBuzzViewController.self)
        _ = viewController.view
        let interactor = FizzBuzzInteractor()
        let mockOutput = MockFizzBuzzPresenterInput()
        viewController.output = interactor
        interactor.output = mockOutput

        XCTAssertFalse(mockOutput.didCallDisplayResult)
        XCTAssertFalse(mockOutput.didCallResetDisplay)
        XCTAssertNil(mockOutput.passedDisplayResult)

        viewController.numberTextField.text = nil
        viewController.testButtonClicked(nil)
        if let passedDisplayResult = mockOutput.passedDisplayResult {
            XCTAssert(passedDisplayResult == .none)
        } else {
            XCTFail()
        }

        viewController.numberTextField.text = "2"
        viewController.testButtonClicked(nil)
        if let passedDisplayResult = mockOutput.passedDisplayResult {
            XCTAssert(passedDisplayResult == .none)
        } else {
            XCTFail()
        }

        viewController.numberTextField.text = "3"
        viewController.testButtonClicked(nil)
        XCTAssert(mockOutput.passedDisplayResult == .fizz)
        viewController.numberTextField.text = nil

        viewController.numberTextField.text = "5"
        viewController.testButtonClicked(nil)
        XCTAssert(mockOutput.passedDisplayResult == .buzz)
        viewController.numberTextField.text = nil

        viewController.numberTextField.text = "15"
        viewController.testButtonClicked(nil)
        XCTAssert(mockOutput.passedDisplayResult == .fizzBuzz)
        viewController.numberTextField.text = nil

        XCTAssertFalse(mockOutput.didCallResetDisplay)

    }

    /// Send actions from the Interactor-Presenter to Test the Mock Output
    func testInteractorPresenter() {
        let interactor = FizzBuzzInteractor()
        let presenter = FizzBuzzPresenter()
        let mockOutput = MockFizzBuzzViewInput()
        interactor.output = presenter
        presenter.output = mockOutput

        XCTAssertFalse(mockOutput.didCallShowAlert)
        XCTAssertFalse(mockOutput.didCallResetDisplay)
        XCTAssertNil(mockOutput.passedShowAlertValue)

        interactor.test(number: nil)
        XCTAssert((mockOutput.passedShowAlertValue ?? ("","")) == ("Result", "Not Applicable"))

        interactor.test(number: 2)
        XCTAssert((mockOutput.passedShowAlertValue ?? ("","")) == ("Result", "Not Applicable"))

        interactor.test(number: 3)
        XCTAssert(mockOutput.didCallShowAlert)
        XCTAssertNotNil(mockOutput.passedShowAlertValue)
        XCTAssert((mockOutput.passedShowAlertValue ?? ("","")) == ("Result", "Fizz"))

        interactor.test(number: 5)
        XCTAssert((mockOutput.passedShowAlertValue ?? ("","")) == ("Result", "Buzz"))

        interactor.test(number: 15)
        XCTAssert((mockOutput.passedShowAlertValue ?? ("","")) == ("Result", "FizzBuzz"))

        interactor.alertDismissed()
        XCTAssert(mockOutput.didCallResetDisplay)
    }

    /// Send actions from the Presenter-View to Test the Mock Output
    func testPresenterView() {
        let presenter = FizzBuzzPresenter()
        let viewController = AppStoryboard.FizzBuzz.instantiate(FizzBuzzViewController.self)
        _ = viewController.view
        let mockOutput = MockFizzBuzzInteractorInput()
        presenter.output = viewController
        viewController.output = mockOutput

        XCTAssertFalse(mockOutput.didCallTestNumber)
        XCTAssertFalse(mockOutput.didCallAlertDismissed)
        XCTAssertNil(mockOutput.passedTestNumber)

        presenter.resetDisplay()
        XCTAssertFalse(mockOutput.didCallTestNumber)
        XCTAssertFalse(mockOutput.didCallAlertDismissed)
        XCTAssert((viewController.numberTextField.text ?? "").isEmpty)
        XCTAssertFalse(mockOutput.didCallTestNumber)

        presenter.display(result: .fizz)
        // false because the "Ok" button cannot be clicked
        // therefore the alert cannot be dismissed.
        XCTAssertFalse(mockOutput.didCallAlertDismissed)
        XCTAssertNil(mockOutput.passedTestNumber)

        presenter.display(result: .buzz)
        // false because the "Ok" button cannot be clicked
        // therefore the alert cannot be dismissed.
        XCTAssertFalse(mockOutput.didCallAlertDismissed)
        XCTAssertNil(mockOutput.passedTestNumber)

        presenter.display(result: .fizzBuzz)
        // false because the "Ok" button cannot be clicked
        // therefore the alert cannot be dismissed.
        XCTAssertFalse(mockOutput.didCallAlertDismissed)
        XCTAssertNil(mockOutput.passedTestNumber)

        presenter.display(result: .none)
        // false because the "Ok" button cannot be clicked
        // therefore the alert cannot be dismissed.
        XCTAssertFalse(mockOutput.didCallAlertDismissed)
        XCTAssertNil(mockOutput.passedTestNumber)
    }
    
}
