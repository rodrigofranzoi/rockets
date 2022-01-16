//
//  StringExtensions.swift
//  Devskiller
//
//  Created by Rodrigo Franzoi on 06/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation

extension String {
    public func initials() -> String {
        let terms = components(separatedBy: " ")
        let firstInitial = terms.first?.first.map { "\($0)" } ?? ""
        let firstLastInitial = terms.first?.last.map { "\($0)" } ?? ""
        let lastInitial = terms.last?.first.map { "\($0)" } ?? ""
        return terms.count == 1 ? firstInitial + firstLastInitial : firstInitial + lastInitial
    }
    
    public func date(with format: DateFormat = .iso8601) -> Date? {
        return date(with: format.rawValue)
    }

    public func date(with format: String) -> Date? {
        let formatter = Date.dateFormatter(for: format)
        if let date = formatter.date(from: self) {
            return date
        }

        formatter.isLenient = true

        return formatter.date(from: self)
    }
    
    public func date(with currentFormat: DateFormat, newFormat: DateFormat) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = currentFormat.rawValue
        
        let convertedDate = formatter.date(from: self)
        formatter.dateFormat = newFormat.rawValue
        
        if let date = convertedDate {
            let stringDate = formatter.string(from: date)
            return formatter.date(from: stringDate)
        } else {
            return nil
        }
    }
}
