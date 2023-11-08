//
//  StringExternsions.swift
//  MovieApp
//
//  Created by Enes Kaya on 7.11.2023.
//

import Foundation
import UIKit

extension String {
    /// it will convert string to date
    public func getFormattedDate() -> String?{
        let dateFormatterGet = DateFormatter()
        let dateFormat = "dd MMM yyyy"
        dateFormatterGet.dateFormat = dateFormat
        
        let date: Date = dateFormatterGet.date(from: self) ?? Date()
        return dateFormatterGet.string(from: date)
    }

}

