//
//  CoreApi.swift
//  Devskiller
//
//  Created by Rodrigo Franzoi on 08/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation

class CoreApi: APIProvider {
    
    private let session = URLSession.shared
    
    func callForObject<T>(url: URL, completion: @escaping (CompletionStatus<T>) -> Void) where T : DecodableOutput {
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(.failed(.api))
                return
            }
            do {
                let results = try  JSONDecoder().decode(T.self, from: data)
                completion(.succeeded(results))
            } catch {
                completion(.failed(.decoding))
            }
        }
        task.resume()
    }
    
    func callForList<T>(url: URL, completion: @escaping (CompletionStatus<[T]>) -> Void) where T : DecodableOutput {
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(.failed(.api))
                return
            }
            do {
                let results = try  JSONDecoder().decode([T].self, from: data)
                completion(.succeeded(results))
            } catch {
                completion(.failed(.decoding))
            }
        }
        task.resume()
    }
}
