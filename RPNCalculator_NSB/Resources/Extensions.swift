//
//  Extensions.swift
//  RPNCalculator_NSB
//
//  Created by Kamil Wrobel on 10/3/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import Foundation



extension Double {
    /// Rounds the double to decimal places value
    func myRounding(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}


extension String {
    mutating func clean() -> String {
        if self.last == "0"{
            self.removeLast()
            if self.last == "."{
                self.removeLast()
            }
        }
        return self
    }
}




