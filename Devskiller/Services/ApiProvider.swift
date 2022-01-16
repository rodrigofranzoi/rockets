//
//  ApiProvider.swift
//  Devskiller
//
//  Created by Rodrigo Franzoi on 08/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation

public protocol APIProvider {
    func callForObject<T: DecodableOutput>(url: URL, completion: @escaping (CompletionStatus<T>) -> Void)
    func callForList<T: DecodableOutput>(url: URL, completion: @escaping (CompletionStatus<[T]>) -> Void)
}
