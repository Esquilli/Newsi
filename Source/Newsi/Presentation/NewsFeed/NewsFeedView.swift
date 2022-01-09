//
//  NewsFeedView.swift
//  Newsi
//
//  Created by Pedro Fernandez on 1/7/22.
//

import SwiftUI

struct NewsFeedView: View {
    @StateObject var viewModel = NewsFeedViewModel(newsRepository: NewsWebRepository())

    var body: some View {
        GeometryReader { proxy in
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failed(let error):
                ErrorView(error: error, retryAction: {
                    viewModel.load()
                })
            case .success(let articles):
                TabView {
                    ForEach(articles.data) { article in
                        ArticleView(article: article)
                    }
                    .rotationEffect(.degrees(-90.0))
                    .frame(width: proxy.size.width, height: proxy.size.height)
                }
                .frame(width: proxy.size.height, height: proxy.size.width)
                .rotationEffect(.degrees(90.0), anchor: .topLeading)
                .offset(x: proxy.size.width)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
        }
        .onAppear(perform: viewModel.load)
        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedView()
    }
}
