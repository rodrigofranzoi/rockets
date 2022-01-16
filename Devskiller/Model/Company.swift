//
//  Company.swift
//  Devskiller
//
//  Created by Rodrigo Franzoi on 06/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation

struct Company: DecodableOutput {
    let name: String
    let founder: String
    let founded: Int
    let employees: Int
    let vehicles: Int
    let launch_sites: Int
    let test_sites: Int
    let ceo: String
    let cto: String
    let coo: String
    let cto_propulsion: String
    let valuation: Int
    let summary: String
    
    static func mock() -> Company {
        return Company(name: "Rodrigo",
                       founder: "Rodrigo",
                       founded: 2021,
                       employees: 200,
                       vehicles: 200,
                       launch_sites: 200,
                       test_sites: 200,
                       ceo: "Rodrigo",
                       cto: "Rodrigo",
                       coo: "Rodrigo",
                       cto_propulsion: "Rodrigo",
                       valuation: 10000000,
                       summary: "summary")
    }
}
