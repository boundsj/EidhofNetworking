//
//  Resource.swift
//  EidhofNetworking
//
//  Created by Jesse Bounds on 8/22/16.
//  Copyright © 2016 Rebounds. All rights reserved.
//

import Foundation

public struct Resource<T> {
    public let url: URL
    public let parse: (Data) -> T?
    
    public init(url: URL, parseJSON: @escaping (Any) -> T?) {
        self.url = url
        self.parse = { data in
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            return json.flatMap(parseJSON)
        }
    }
}
