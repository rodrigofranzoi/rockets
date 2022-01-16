//
//  Mission.swift
//  Devskiller
//
//  Created by Rodrigo Franzoi on 06/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation

struct Mission: DecodableOutput {
    
    let launch_success: Bool?
    let mission_name: String
    let flight_number: Int
    let links: Links
    let rocket: Rocket
    let launch_date_local: String
    let launch_year: String
    
    
    static func mock() -> Mission {
        return Mission(launch_success: true,
                       mission_name: "Test",
                       flight_number: 1,
                       links: Links.mock(),
                       rocket: Rocket.mock(),
                       launch_date_local: "2018-07-22T01:50:00-04:00",
                       launch_year: "2018")
    }
    
}
