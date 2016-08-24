//
//  WebService.swift
//  EidhofNetworking
//
//  Created by Jesse Bounds on 8/22/16.
//  Copyright © 2016 Rebounds. All rights reserved.
//

import Foundation

public final class WebService {
    
    public init() {}
   
    public func load<T>(_ resource: Resource<T>, completion: @escaping (T?) -> ()) {
        URLSession.shared.dataTask(with: resource.url) { (data, _, _) in
            let result = data.flatMap(resource.parse)
            completion(result)
        }.resume()
    }
    
}
