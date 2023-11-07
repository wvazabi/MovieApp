//
//  DoubleExtensions.swift
//  MovieApp
//
//  Created by Enes Kaya on 7.11.2023.
//

import Foundation

extension Double {
    public func toString() -> String{
        return  String(self)
    }
    
    public func roundToPlaces(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
        }
    
    public func toInt() -> Int? {
            if self >= Double(Int.min) && self < Double(Int.max) {
                return Int(self)
            } else {
                return nil
            }
        }
}
