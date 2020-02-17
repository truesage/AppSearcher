//
//  Response.swift
//  AppSearcher
//
//  Created by JinSung Lee on 2020/02/14.
//  Copyright © 2020 JinSung Lee. All rights reserved.
//

import Foundation

class Response : Codable, CustomStringConvertible {
    var resultCount : Int?
    var results : [Result]?

    var description: String {
        "Response(resultCount: \(resultCount), results: \(results))"
    }
}
