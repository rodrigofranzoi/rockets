//
//  DecodableOutput.swift
//  Devskiller
//
//  Created by Rodrigo Franzoi on 08/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation

public protocol Mockable {
    static func mock() -> Self
}

public typealias DecodableOutput = Decodable & Mockable
