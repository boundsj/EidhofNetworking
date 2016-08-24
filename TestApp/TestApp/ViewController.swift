//
//  ViewController.swift
//  TestApp
//
//  Created by Jesse Bounds on 8/22/16.
//  Copyright © 2016 Rebounds. All rights reserved.
//

import UIKit
import EidhofNetworking

typealias JSONDictionary = [String: Any]

let url = URL(string: "http://localhost:8000/episodes.json")!

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        WebService().load(Episode.all) { result in
            print(result)
        }
    }

}

struct Episode {
    
    let identifier: String
    let title: String
    
    init?(dictionary: JSONDictionary) {
        guard let id = dictionary["id"] as? String,
            let title = dictionary["title"] as? String else { return nil }
        self.identifier = id
        self.title = title
    }
    
}

extension Episode {
    
    static let all = Resource<[Episode]>(url: url, parseJSON: { json in
        guard let dictionaries = json as? [JSONDictionary] else { return nil }
        return dictionaries.flatMap(Episode.init)
    })
    
}
