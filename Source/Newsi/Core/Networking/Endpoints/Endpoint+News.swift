//
//  Endpoint+News.swift
//  Newsi
//
//  Created by Pedro Fernandez on 1/6/22.
//

import Combine
import Foundation

extension Endpoint {
    struct News: EndpointProtocol {
        var path: String
        var queryItems: [URLQueryItem] = []
        private static let newsApiKey = (Bundle.main.infoDictionary?["NEWS_API_KEY"] as? String)!
        
        var url: URL {
            var components = URLComponents()
            components.scheme = "https"
            components.host = "newsapi.org"
            components.path = "/v2" + path
            components.queryItems = queryItems
            
            guard let url = components.url else {
                preconditionFailure("Invalid URL components: \(components)")
            }
            
            return url
        }
        
        var headers: [String: Any] {
            return [:]
        }
    }
}

extension Endpoint.News {
    static func news(keywords: [String], count: Int) -> Self {
        return Endpoint.News(path: "/everything",
                             queryItems: [
                                URLQueryItem(name: "apiKey", value: newsApiKey),
                                URLQueryItem(name: "q", value: keywords.joined(separator: ",")),
                                URLQueryItem(name: "pageSize", value: "\(count)")
        ])
    }
}
