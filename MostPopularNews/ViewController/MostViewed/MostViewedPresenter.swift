//
//  MostViewedPresenter.swift
//  MostPopularNews
//
//  Created by Developer on 07.05.2021.
//

import UIKit

protocol MostViewedPresenter {
    func getMostViewedNews(completion: @escaping ([Result]?) -> Void)
    func pushDetailNewsVC(view: UIViewController, news: Result)
}

final class MostViewedPresenterImpl: MostViewedPresenter {

    let navigator: NewsNavigator

    init(navigator: NewsNavigator) {
        self.navigator = navigator
    }

    func getMostViewedNews(completion: @escaping ([Result]?) -> Void) {
        AlamofireNetwork.getNews(filterType: APIEndpoint.getViewedNews.stringValue ) { news in
            completion(news.results)
        }
    }

    func pushDetailNewsVC(view: UIViewController, news: Result) {
        navigator.pushDetailNewsVC(from: view, news: news)
    }


}

