//
//  Optionals.swift
//  MovieApp
//
//  Created by Enes Kaya on 7.11.2023.
//

import Foundation

extension Optional {
    public func isNil<T>(value: T) -> T {
        if self != nil {
            return self as! T
        }
        return value
    }
}
