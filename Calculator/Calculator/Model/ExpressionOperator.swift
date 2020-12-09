//
//  ExpressionOperator.swift
//  Calculator
//
//  Created by ILLIA HARKAVY on 9/18/20.
//  Copyright © 2020 ILLIA HARKAVY. All rights reserved.
//

import Foundation

enum ExpressionOperator: String, CaseIterable {
    
    case add = "+"
    case substract = "−"
    case multiply = "×"
    case divide = "÷"
    
    case percent = "%"
    
    case sin = "sin"
    case cos = "cos"
    case tan = "tan"
    case cotan = "cotan"
    case asin = "asin"
    case acos = "acos"
    case atan = "atan"
    case acotan = "acotan"
    
    case squareRoot = "√"
    case cubeRoot = "∛"
    case square = "²"
    case cube = "³"
    case exp = "exp"
    case ln = "ln"
    case log = "log"
    
    var type: Type  {
        switch self {
        case .add: return .binary
        case .substract: return .binary
        case .multiply: return .binary
        case .divide: return .binary
        case .percent: return .unaryPostfix
        case .sin: return .unaryPrefix(requiresBrackets: true)
        case .cos: return .unaryPrefix(requiresBrackets: true)
        case .tan: return .unaryPrefix(requiresBrackets: true)
        case .cotan: return .unaryPrefix(requiresBrackets: true)
        case .asin: return .unaryPrefix(requiresBrackets: true)
        case .acos: return .unaryPrefix(requiresBrackets: true)
        case .atan: return .unaryPrefix(requiresBrackets: true)
        case .acotan: return .unaryPrefix(requiresBrackets: true)
            
        case .squareRoot: return .unaryPrefix(requiresBrackets: false)
        case .cubeRoot: return .unaryPrefix(requiresBrackets: false)
        case .square: return .unaryPostfix
        case .cube: return .unaryPostfix
        case .exp: return .unaryPrefix(requiresBrackets: true)
        case .ln: return .unaryPrefix(requiresBrackets: true)
        case .log: return .unaryPrefix(requiresBrackets: true)
        }
    }
    
    enum `Type` {
        case binary
        case unaryPrefix(requiresBrackets: Bool)
        case unaryPostfix
    }
    
    var hasPrefixOperand: Bool {
        if case .unaryPrefix = type {
            return false
        } else {
            return true
        }
    }
    
    var hasPostfixOperand: Bool {
        if case .unaryPostfix = type {
            return false
        } else {
            return true
        }
    }
    
    var requiresBracketsForPostfixOperand: Bool {
        switch self {
        case .sin, .cos, .tan, .cotan, .asin, .acos, .atan, .acotan, .exp, .ln, .log:
            return true
        default:
            return false
        }
    }
}
