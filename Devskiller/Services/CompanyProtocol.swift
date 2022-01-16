//
//  CompanyProtocol.swift
//  Devskiller
//
//  Created by Rodrigo Franzoi on 06/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation

protocol CompanyServiceInput: AnyObject {
    var output: CompanyServiceOutput? { get set }
    func getCompanyDetails()
}

protocol CompanyServiceOutput: AnyObject {
    func detail(details :Company)
    func errorCompany()
}

class CompanyService: CompanyServiceInput {
  
    weak var output: CompanyServiceOutput?
    
    private var isFetching: Bool = false
    private let baseUrl = "https://api.spacexdata.com/v3/info"
    
    private let api: APIProvider
    
    init(api: APIProvider = CoreApi()) {
        self.api = api
    }
    
    public func getCompanyDetails(){
        guard let url = URL(string: baseUrl) else { return }
        self.isFetching = true
        api.callForObject(url: url) { (status: CompletionStatus<Company>) in
            switch status {
            case .succeeded(let company):
                self.output?.detail(details: company)
            case .failed:
                self.output?.errorCompany()
            }
        }
    }
    
    
}
