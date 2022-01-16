//
//  MainViewModel.swift
//  Devskiller
//
//  Created by Rodrigo Franzoi on 06/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation

class MainViewModel {
    
    private let missionsService: MissionsServiceInput
    private let companyService: CompanyServiceInput
    
    public let sectionsTitle: [String] = ["Company", "Missions"]
    public var missions: [Mission] = []
    public var delegate: MainViewDelegate?
    public var info: String = ""
    
    public var years: [String] = []
    
    init(missionsService: MissionsServiceInput = MissionsService(),
         companyService: CompanyServiceInput = CompanyService()) {
        self.missionsService = missionsService
        self.companyService = companyService
        missionsService.output = self
        companyService.output = self
    }
    
    func loadData() {
        missionsService.fetchList(year: nil, success: nil, ascending: nil)
        companyService.getCompanyDetails()
    }
    
    public func filter(year: String?, success: Bool?, ascending: Bool?) {
        missionsService.fetchList(year: year, success: success, ascending: ascending)
    }

    
}

extension MainViewModel: MissionsServiceOutput {
    func reloadData(list: [Mission]) {
        missions = list
        for mission in missions {
            if years.contains(mission.launch_year) == false {
                years.append(mission.launch_year)
            }
        }
        delegate?.reloadTable()
    }
    
    func errorMissions() { }
}

extension MainViewModel: CompanyServiceOutput {
    func detail(details: Company) {
        info = "\(details.name) was founded by \(details.ceo) in \(details.founded). It has now \(details.employees) employees, \(details.launch_sites) launch sites, and is valuated at USD \(details.valuation)."
        delegate?.reloadTable()
        delegate?.configureTitle(details.name)
    }
    
    func errorCompany() { }
}
