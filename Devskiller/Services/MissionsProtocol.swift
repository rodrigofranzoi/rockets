//
//  MissionsService.swift
//  Devskiller
//
//  Created by Rodrigo Franzoi on 06/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation

protocol MissionsServiceInput: AnyObject {
    var output: MissionsServiceOutput? { get set }
    func fetchList(year: String?, success: Bool?, ascending: Bool?)
}

protocol MissionsServiceOutput: AnyObject {
    func reloadData(list: [Mission])
    func errorMissions()
}

class MissionsService: MissionsServiceInput {
  
    weak var output: MissionsServiceOutput?
    
    private var isFetching: Bool = false
    private let api: APIProvider
    private let baseUrl = "https://api.spacexdata.com/v3/launches"
    
    init(api: APIProvider = CoreApi()) {
        self.api = api
    }
    
    func fetchList(year: String?, success: Bool?, ascending: Bool?) {
        if isFetching == false {
            getMissionsList(year: year, success: success, ascending: ascending)
        }
    }
    
    public func getMissionsList(year: String?, success: Bool?, ascending: Bool?) {
        var urlComponents = URLComponents(string: baseUrl)
        urlComponents?.queryItems = [URLQueryItem(name: "launch_year", value: year)]
        
        if let success = success {
            urlComponents?.queryItems?.append( URLQueryItem(name: "launch_success", value: success ? "true" : "false"))
        }
        guard let url = urlComponents?.url else { return }
        self.isFetching = true
        api.callForList(url: url) { (status: CompletionStatus<[Mission]>) in
            self.isFetching = false
            switch status {
            case .succeeded(let missions):
                self.output?.reloadData(list: missions.sorted { (ascending ?? true)
                    ? $0.launch_date_local < $1.launch_date_local
                    : $0.launch_date_local > $1.launch_date_local })
            case .failed:
                self.output?.errorMissions()
            }
        }
    }
    
}
