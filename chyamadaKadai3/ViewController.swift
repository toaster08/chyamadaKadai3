//
//  ViewController.swift
//  chyamadaKadai3
//
//  Created by toaster on 2021/06/20.
//

import UIKit

final class ViewController: UIViewController {
    
    private var textField:[UITextField] = []
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
        
        //keyboardをNumberPadに設定
        textField = [firstTextField,secondTextField]
        textField.forEach{ $0.keyboardType = .numberPad }
        
        calclateButton.addTarget(self,action: #selector(calculate),for: .touchUpInside)
    }
}

@objc extension ViewController {
    func calculate(){
        
        if firstSignSwitch.isOn {
            if firstTextField.text != ""  {
                firstNumberLabel.text = "-" + firstTextField.text!
            } else {
                firstNumberLabel.text = "0"
            }
        } else  {
            if firstTextField.text != ""  {
                firstNumberLabel.text = firstTextField.text
            } else {
                firstNumberLabel.text = "0"
            }
        }
        
        if secondSignSwitch.isOn {
            if secondTextField.text != "" {
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
        
        let numbers = [firstNumberLabel,secondNumberLabel]
        let result = numbers
            .map { Int($0?.text ?? "") ?? 0}
            .reduce(0,+)
        resultLabel.text = result.description
    }
}
