//
//  NewsFeedViewModel.swift
//  Newsi
//
//  Created by Pedro Fernandez on 1/7/22.
//

import Combine
import Foundation

class NewsFeedViewModel: ObservableObject {
    @Published var state: LoadingState<Articles> = .loading
    
    private var articles: Articles = Articles(status: "", data: [])
    private var cancellables = Set<AnyCancellable>()
    private let newsRepository: NewsWebRepositoryProtocol
    
    init(newsRepository: NewsWebRepositoryProtocol) {
        self.newsRepository = newsRepository
    }
    
    func load() {
        state = .loading
        self.getNews(keywords: ["anime"], count: 10)
    }
    
    private func getNews(keywords: [String], count: Int) {
        newsRepository.getNews(keywords: keywords, count: count)
        .receive(on: DispatchQueue.main)
        .sink { completion in
            switch completion {
            case .finished:
                self.state = .success(self.articles)
            case .failure(let error):
                print(error)
                self.state = .failed(error)
            }
            
        } receiveValue: { [weak self] response in
            self?.articles = response
        }
        .store(in: &cancellables)
    }
}
