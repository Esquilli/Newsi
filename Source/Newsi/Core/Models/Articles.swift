//
//  Articles.swift
//  Newsi
//
//  Created by Pedro Fernandez on 1/6/22.
//

import Foundation

struct Articles: Codable {
    let status: String
    let data: [Article]
    
    enum CodingKeys: String, CodingKey {
        case status
        case data = "articles"
    }
}
