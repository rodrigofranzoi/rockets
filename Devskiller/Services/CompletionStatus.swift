//
//  CompletionStatus.swift
//  Devskiller
//
//  Created by Rodrigo Franzoi on 08/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation

public enum CompletionStatus<T> {
    case succeeded(T)
    case failed(ErrorType)
}

public enum ErrorType {
    case decoding
    case api
}
