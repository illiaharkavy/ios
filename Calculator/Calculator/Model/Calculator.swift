//
//  Expression.swift
//  Calculator
//
//  Created by LIUBOU KOZUS on 9/4/20.
//  Copyright © 2020 LIUBOU KOZUS. All rights reserved.
//

import Foundation
import MathParser

struct Calculator {
    
    var expression: String = ""
    
    mutating func appendExpressionOperator(_ expressionOperator: ExpressionOperator) {
        func add() {
            if expressionOperator.requiresBracketsForPostfixOperand {
                expression = expression + expressionOperator.rawValue + "("
            } else {
                expression = expression + expressionOperator.rawValue
            }
        }
        if expressionOperator.hasPrefixOperand {
            if trailingNumber != nil || expression.hasSuffix(")") || !(trailingOperator?.hasPostfixOperand ?? true) {
                add()
            }
        } else {
            if !expression.hasSuffix(")"), trailingNumber == nil, trailingOperator?.hasPostfixOperand ?? true  {
                add()
            }
        }
    }
    
    mutating func appendNumber(_ number: String) {
        if !expression.hasSuffix(")"), trailingOperator?.hasPostfixOperand ?? true {
            expression = expression + number
        }
    }
    
    mutating func appendPoint() {
        if let trailingNumber = self.trailingNumber, !trailingNumber.contains(".") {
            expression = expression + "."
        }
    }
    
    mutating func openBracket() {
        if trailingNumber == nil, !expression.hasSuffix(")") {
            expression = expression + "("
        }
    }
    
    mutating func closeBracket() {
        if trailingNumber != nil || expression.hasSuffix(")") || !(trailingOperator?.hasPostfixOperand ?? true), expression.countAll("(") > expression.countAll(")") {
            expression = expression + ")"
        }
    }
    
    mutating func clear() {
        expression = ""
    }
    
    mutating func backspace() {
        if let trailingNumber = self.trailingNumber {
            expression.removeLast(trailingNumber.count)
        } else if let trailingOperator = self.trailingOperator {
            while expression.hasSuffix("(") {
                expression.removeLast()
            }
            expression.removeLast(trailingOperator.rawValue.count)
        }
    }
    
    mutating func calculate() {
        if let result = try? expression.replacingOccurrences(of: "%", with: "*0.01").evaluate() {
            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 5
            expression = formatter.string(from: NSNumber(value: result))!
        }
    }
    
    var trailingNumber: String? {
        var expression = self.expression
        var trailingNumber = ""
        while let last = expression.last, last.isNumber || last == "." {
            trailingNumber.insert(last, at: trailingNumber.startIndex)
            expression.removeLast()
        }
        if trailingNumber.isEmpty {
            return nil
        } else {
            return trailingNumber
        }
    }
    
    var trailingOperator: ExpressionOperator? {
        var expression = self.expression
        while expression.hasSuffix("(") {
            expression.removeLast()
        }
        return ExpressionOperator.allCases.first { expressionOperator in
            expression.hasSuffix(expressionOperator.rawValue)
        }
    }
}

extension Collection where Element: Equatable {
    
    func countAll(where check: (Element) -> Bool) -> Int {
        filter(check).count
    }
    
    func countAll(_ element: Element) -> Int {
        countAll(where: { $0 == element })
    }
}
