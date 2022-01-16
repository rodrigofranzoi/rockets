//
//  Rocket.swift
//  Devskiller
//
//  Created by Rodrigo Franzoi on 06/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation

struct Rocket : DecodableOutput{
    let rocket_id: String
    let rocket_name: String
    let rocket_type: String
    
    static func mock() -> Rocket {
        return Rocket(rocket_id: "123",
                      rocket_name: "Rocket",
                      rocket_type: "1")
    }
}
