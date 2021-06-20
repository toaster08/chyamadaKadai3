//
//  ViewController.swift
//  chyamadaKadai3
//
//  Created by toaster on 2021/06/20.
//

import UIKit

final class ViewController: UIViewController {
    
    private var textField:[String] = []
    
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
        calclateButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        firstSignSwitch.addTarget(self,
                                  action: #selector(changeFirstSign),
                                  for: .touchUpInside)
        secondSignSwitch.addTarget(self,
                                   action:#selector(changeSecondSign),
                                   for: .touchUpInside)
    }

}

@objc extension  ViewController {
    func changeFirstSign(){
        if firstSignSwitch.isOn {
            firstNumberLabel.text = firstTextField.text ?? ""
        } else {
            
        }
    }
    
    func changeSecondSign(){
        if firstSignSwitch.isOn {
            firstNumberLabel.text = firstTextField.text ?? ""
        } else {
            
        }
    }
}

@objc extension ViewController {
    func calculate(){
        textField = [firstNumberLabel.text!,secondNumberLabel.text!]
        let numbers = textField
            .map { Int($0 ?? "") ?? 0}
            .reduce(0,+) //この状態では初期値が0になるため計算結果に誤りが生じる
        
        resultLabel.text = numbers.description
    }
}
