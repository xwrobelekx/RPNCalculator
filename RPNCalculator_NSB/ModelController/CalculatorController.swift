//
//  CalculatorController.swift
//  RPNCalculator_NSB
//
//  Created by Kamil Wrobel on 10/3/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import Foundation


class CalculatorController {
    
    static let shared = CalculatorController()
    
    private init() {}
    
    
    //MARK: - Basic Math operations
    func add(firstNumber: Double, to secondNumber: Double) -> Double {
        return (firstNumber + secondNumber).myRounding(toPlaces: 3)
    }
    
    func subtract(firstNumber: Double, from secondNumber: Double) -> Double {
        return (firstNumber - secondNumber).myRounding(toPlaces: 3)
    }
    
    
    func multiply(firstNumber: Double, with secondNumber: Double) -> Double{
        return (firstNumber * secondNumber).myRounding(toPlaces: 4)
    }
    
    func divide(firstNumber: Double, by secondNumber: Double) -> Double{
        return (firstNumber / secondNumber).myRounding(toPlaces: 4)
    }
    
    typealias operation = (Double, Double) -> Double
    
    func mathOperation(firstNumber: Double, secondNumber: Double, operation: operation) -> Double {
         return operation(firstNumber, secondNumber)
    }
    
    
    
    
    
    
    
    
}
