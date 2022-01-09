//
//  NewsWebRepository.swift
//  Newsi
//
//  Created by Pedro Fernandez on 1/6/22.
//

import Combine
import Foundation

protocol NewsWebRepositoryProtocol: AnyObject {
    var networker: NetworkerProtocol { get }
    
    func getNews(keywords: [String], count: Int) -> AnyPublisher<Articles, Error>
}

final class NewsWebRepository: NewsWebRepositoryProtocol {
    let networker: NetworkerProtocol
    
    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }
    
    func getNews(keywords: [String], count: Int) -> AnyPublisher<Articles, Error> {
        let endpoint = Endpoint.News.news(keywords: keywords, count: count)
        
        return networker.get(type: Articles.self, url: endpoint.url, headers: endpoint.headers)
    }
}
