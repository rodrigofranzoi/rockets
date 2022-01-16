//
//  UIimageExtensions.swift
//  Devskiller
//
//  Created by Rodrigo Franzoi on 06/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func downloadImage(url: String) {
        guard let urlReq = URL(string: url) else { return }
        let req = URLRequest(url: urlReq, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 100)
        let task = URLSession.shared.dataTask(with: req) { data, response, error in
            guard let data = data, let img = UIImage(data: data) else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = img
            }
        }
        task.resume()
    }
}
