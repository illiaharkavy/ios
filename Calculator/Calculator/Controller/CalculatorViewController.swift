//
//  ViewController.swift
//  Calculator
//
//  Created by LIUBOU KOZUS on 9/3/20.
//  Copyright © 2020 LIUBOU KOZUS. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var calculator: Calculator! {
        didSet {
            textField.text = calculator.expression
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculator = Calculator()
    }
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        if sender.currentTitle == "π" {
            calculator.appendNumber("3.1416")
        } else if sender.currentTitle == "e" {
            calculator.appendNumber("2.7183")
        } else if sender.currentTitle == "τ" {
            calculator.appendNumber("6.2832")
        } else {
            calculator.appendNumber(sender.currentTitle!)
        }
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard let currentTitle = sender.currentTitle, let expressionOperator = ExpressionOperator.init(rawValue: currentTitle) else {
            return
        }
        calculator.appendExpressionOperator(expressionOperator)
    }
    
    @IBAction func pointButtonTapped(_ sender: UIButton) {
        calculator.appendPoint()
    }
    
    @IBAction func openBracketButtonTapped(_ sender: UIButton) {
        calculator.openBracket()
    }
    
    @IBAction func closeBracketButtonTapped(_ sender: UIButton) {
        calculator.closeBracket()
    }
    
    @IBAction func equalsButtonTapped(_ sender: UIButton) {
        calculator.calculate()
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        calculator.clear()
    }
    
    @IBAction func backspaceButtonTapped(_ sender: UIButton) {
        calculator.backspace()
    }
}

