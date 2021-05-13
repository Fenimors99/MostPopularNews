//
//  MostEmailedPresenter.swift
//  MostPopularNews
//
//  Created by Developer on 07.05.2021.
//

import UIKit

protocol MostEmailedPresenter {
    func getMostEmailedNews(completion: @escaping ([Result]) -> Void)
    func pushDetailNewsVC(view: UIViewController, news: Result)
}

final class MostEmailedPresenterImpl: MostEmailedPresenter {

    let navigator: NewsNavigator

    init(navigator: NewsNavigator) {
        self.navigator = navigator
    }

    func getMostEmailedNews(completion: @escaping ([Result]) -> Void) {
        AlamofireNetwork.getNews(filterType: APIEndpoint.getEmailedNews.stringValue ) { news in
            completion(news.results ?? [])
        }
    }

    func pushDetailNewsVC(view: UIViewController, news: Result) {
        navigator.pushDetailNewsVC(from: view, news: news)
    }

}

