//
//  TestApi.swift
//  DevskillerTests
//
//  Created by Rodrigo Franzoi on 08/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation
import Devskiller

class TestApi: APIProvider {
    func callForObject<T>(url: URL, completion: @escaping (CompletionStatus<T>) -> Void) where T : DecodableOutput {
        completion(.succeeded(T.mock()))
    }
    
    func callForList<T>(url: URL, completion: @escaping (CompletionStatus<[T]>) -> Void) where T : DecodableOutput {
        completion(.succeeded([T.mock(), T.mock()]))
    }
}
