//
//  Articles.swift
//  Newsi
//
//  Created by Pedro Fernandez on 1/6/22.
//

import Foundation

struct Articles: Codable {
    let data: [Article]
    
    enum CodingKeys: String, CodingKey {
        case data = "articles"
    }
}
