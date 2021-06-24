//
//  ViewController.swift
//  chyamadaKadai3
//
//  Created by toaster on 2021/06/20.
//

import UIKit

// Errorタイプ
enum ErrorMessage {
    static let nonNumeric = "数を入力してください"
}

final class ViewController: UIViewController {
    private var textField: [UITextField] {
        [firstTextField, secondTextField]
    }

    @IBOutlet private weak var firstTextField: UITextField!
    @IBOutlet private weak var secondTextField: UITextField!

    @IBOutlet private weak var firstNumberLabel: UILabel!
    @IBOutlet private weak var secondNumberLabel: UILabel!
    @IBOutlet private weak var resultLabel: UILabel!

    @IBOutlet private weak var calclateButton: UIButton!

    @IBOutlet private weak var firstSignSwitch: UISwitch!
    @IBOutlet private weak var secondSignSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // keyboardをNumberPadに設定
        textField.forEach { $0.keyboardType = .numberPad }
        calclateButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
    }
}

@objc extension ViewController {
    func calculate() {
        guard let firstNumber = Int(firstTextField.text ?? ""),
              let secondNumber = Int(secondTextField.text ?? "") else {
            resultLabel.text = ErrorMessage.nonNumeric
            return
        }

        let firstSignedNumber = firstNumber * (firstSignSwitch.isOn ? -1 : 1)
        let secondSignedNumber = secondNumber * ( secondSignSwitch.isOn ? -1 : 1)

        firstNumberLabel.text = String(firstSignedNumber)
        secondNumberLabel.text = String(secondSignedNumber)

        // Labelの配列を取り、mapとreduceメソッドで計算
        let numbers = [firstSignedNumber, secondSignedNumber]
        let result = numbers
            .reduce(0, +)
        resultLabel.text = String(result)
    }
}
