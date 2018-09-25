//
// FizzBuzzViewController.swift
// FizzBuzzFooBar
//
// Created by Zonily Jame Pesquera on 24/09/2018.
// Copyright © 2018 kuyazee. All rights reserved.
//

import UIKit

protocol FizzBuzzViewInput: class {
    func showAlert(withTitle title: String, andMessage message: String)

    func resetDisplay()
}

class FizzBuzzViewController: UIViewController, FizzBuzzViewInput {

    var output: FizzBuzzInteractorInput?

    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var testButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Fizz Buzz Test"
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.numberTextField.becomeFirstResponder()
    }

    @IBAction func testButtonClicked(_ sender: Any?) {
        self.output?.test(number: Int(self.numberTextField.text ?? ""))
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
                self.output?.alertDismissed()
        }))
        self.present(alertController, animated: true, completion: nil)
    }

    func resetDisplay() {
        self.numberTextField.text = nil
    }

}
