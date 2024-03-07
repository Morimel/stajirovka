//
//  Model.swift
//  staj
//
//  Created by Isa Melsov on 2/3/24.
//

import Foundation

struct Model: Codable {
    let image: URL
    let name: String
    let status: String
}

struct ModelArray: Codable {
    let results: [Model]
}
