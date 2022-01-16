//
//  FilterViewModel.swift
//  Devskiller
//
//  Created by Rodrigo Franzoi on 07/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation

class FilterViewModel {
    
    public var delegate: MainViewDelegate
    
    public let headers:[String] = ["Sort", "Launch", "Years"]
    public let sorting:[String] = ["Ascending", "Descending"]
    public let launch:[String] = ["Success", "Failure"]
    public var years:[String]
    
    public var data: [[String]] { [sorting, launch, years] }
    
    init(years: [String], delegate: MainViewDelegate) {
        self.years = years
        self.delegate = delegate
    }
    
    public func doneTap(indexes: [IndexPath]?){
        guard let indexes = indexes else { return delegate.filterList(year: nil, success: nil, ascending: nil) }
        var year: String?
        var success: Bool?
        var ascending: Bool?
        
        for index in indexes {
            if index.section == 2 { year = years[index.row] }
            else if index.section == 1 { success = (index.row == 0) }
            else if index.section == 0 { ascending = (index.row == 0) }
        }
        
        delegate.filterList(year: year, success: success, ascending: ascending)
    }
    
}
