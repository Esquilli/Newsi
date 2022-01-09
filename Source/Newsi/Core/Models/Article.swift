//
//  Article.swift
//  Newsi
//
//  Created by Pedro Fernandez on 1/6/22.
//

import Foundation

struct Article: Codable, Identifiable {
    let id = UUID()
    let source: Source
    let author: String?
    let title, articleDescription: String
    let url: String
    let urlToImage: String
    let publishedAt: Date
    let content: String

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
    
    struct Source: Codable {
        let id: String?
        let name: String
    }
}

extension Article {
    static func fake() -> Self {
        return Article(source: Source(id: nil, name: "Lifehacker.com"),
                       author: "Khamosh Pathak",
                       title: "You Can Now Open Your Hotel Room Door With an iPhone, But Should You?",
                       articleDescription: "Apple wants your iPhone to unlock all sorts of doors. Their car keys feature already lets you use your iPhone to unlock some...",
                       url: "https://lifehacker.com/you-can-now-open-your-hotel-room-door-with-an-iphone-b-1848185461",
                       urlToImage: "https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/f912a797bdf971bfa44699c62a6d3e80.png",
                       publishedAt: Date(),
                       content: "Apple wants your iPhone to unlock all sorts of doors. Their car keys feature already lets you use your iPhone to unlock some supported cars...")
    }
}
