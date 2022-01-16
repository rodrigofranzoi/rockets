//
//  DateExtensions.swift
//  Devskiller
//
//  Created by Rodrigo Franzoi on 06/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation

public enum DateFormat: String {

    case date = "dd/MM/yyyy"
    case time = "HH:mm"
    
    case iso8601 = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    case otherIso8601 = "yyyy-MM-dd'T'HH:mm:ssZ"
}

extension Date {
    
    public var dateTime: String {
        return string(from: .date) + " at " + string(from: .time)
    }
    
    static func dateFormatter(for dateFormat: String) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.autoupdatingCurrent
        formatter.dateFormat = dateFormat
        return formatter
    }
    
    public func string(from dateFormat: DateFormat) -> String {
        let formatter = Date.dateFormatter(for: dateFormat.rawValue)
        return formatter.string(from: self)
    }
    
    public func daysBetween(date: Date) -> Int{
        let components = NSCalendar.current.dateComponents([.day], from: self, to: date)
        if let days = components.day { return abs(days) }
        else { return -1 }
    }
    
}

