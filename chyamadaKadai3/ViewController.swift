//
//  ViewController.swift
//  chyamadaKadai3
//
//  Created by toaster on 2021/06/20.
//

import UIKit

// Errorタイプ
enum TextError: Error {
    case nonNumeric
    case unknown

    var description: String {
        switch self {
        // switch文で列挙した各タイプのdescriptionを返す
        case .nonNumeric:return "数を入力してください"
        case .unknown:return "不明なエラーです"
        }
    }
}

final class ViewController: UIViewController {
    private var textField: [UITextField] = []

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
        textField = [firstTextField, secondTextField]
        textField.forEach { $0.keyboardType = .numberPad }
        calclateButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
    }
}

@objc extension ViewController {
    func calculate() {
        // textFieldに数が未入力あるいはInt型にキャストできない文字列が入力されている場合はReturn
        guard firstTextField.text != "", Int(firstTextField.text!) != nil else {
            resultLabel.text = TextError.nonNumeric.description
            return
        }

        guard secondTextField.text != "", Int(secondTextField.text!) != nil else {
            resultLabel.text = TextError.nonNumeric.description
            return
        }

        //isOnでは負の値
        if firstSignSwitch.isOn {
            //入力されており"0"でない場合は"-"を結合した文字列をLabelに代入
            //そうでない場合は"0"を代入
            if firstTextField.text != "" && firstTextField.text != "0" {
                firstNumberLabel.text = "-" + firstTextField.text!
            } else {
                firstNumberLabel.text = "0"
            }
        } else {
            if firstTextField.text != "" {
                firstNumberLabel.text = firstTextField.text
            } else {
                firstNumberLabel.text = "0"
            }
        }

        if secondSignSwitch.isOn {
            if secondTextField.text != "" && secondTextField.text != "0" {
                secondNumberLabel.text = "-" + secondTextField.text!
            } else {
                secondNumberLabel.text = "0"
            }
        } else {
            if secondTextField.text != "" {
                secondNumberLabel.text = secondTextField.text!
            } else {
                secondNumberLabel.text = "0"
            }
        }

        //Labelの配列を取り、mapとreduceメソッドで計算
        let numbers = [firstNumberLabel, secondNumberLabel]
        let result = numbers
            .map { Int($0?.text ?? "") ?? 0}
            .reduce(0, +)
        resultLabel.text = result.description
    }
}
