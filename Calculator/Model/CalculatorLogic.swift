//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Wallace Santos on 13/07/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic{
    
    private var number:Double?
    
    private var intermediateCalculation:(firstNumber:Double, operation:String)?
    
    mutating func setNumber(_ number:Double){
        self.number = number
    }
    
    
    mutating func calculate(symbol:String) -> Double?{
        
        if let n = number{
            switch symbol{
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumCalculation(n2: n)
            default:
                intermediateCalculation = (firstNumber: n, operation: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2:Double) -> Double?{
        
        if let n1 = intermediateCalculation?.firstNumber, let operation = intermediateCalculation?.operation {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("Operation does not match any of the cases.")
            }
        }
        return nil
    }
    
}
