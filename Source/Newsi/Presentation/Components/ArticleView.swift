//
//  ArticleView.swift
//  Newsi
//
//  Created by Pedro Fernandez on 1/7/22.
//

import SwiftUI
import SafariServices

struct ArticleView: View {
    @State var article: Article
    @State var showWebView = false
    
    var body: some View {
        Button(action: { self.showWebView = true }) {
            GeometryReader { proxy in
                ZStack(alignment: .bottom) {
                    ImageView(url: article.urlToImage)
                        .frame(width: proxy.size.width , height: proxy.size.height)
                    
                    VStack (alignment: .leading, spacing: 6) {
                        Text(article.source.name)
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .foregroundColor(.white)
                            .lineLimit(1)
                        Text(article.title)
                            .font(.system(size: 26, weight: .bold, design: .default))
                            .foregroundColor(.white)
                        Text(article.content)
                            .font(.system(size: 16, weight: .regular, design: .default))
                            .foregroundColor(.white)
                            .lineLimit(3)
                    }
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 70, trailing: 20))
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
        .sheet(isPresented: $showWebView) {
            WebView(url: URL(string: self.article.url)!).edgesIgnoringSafeArea(.all)
        }
    }
}

struct WebView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<WebView>) -> SFSafariViewController {
        let webview = SFSafariViewController(url: url)
        return webview
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<WebView>) {
        // No-op
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.fake())
            .previewLayout(.sizeThatFits)
    }
}
