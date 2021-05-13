//
//  MostSharedPresenter.swift
//  MostPopularNews
//
//  Created by Developer on 07.05.2021.
//

import UIKit

protocol MostSharedPresenter {
    func getMostSharedNews(completion: @escaping ([Result]?) -> Void)
    func pushDetailNewsVC(view: UIViewController, news: Result)
}

final class MostSharedPresenterImpl: MostSharedPresenter {

    let navigator: NewsNavigator

    init(navigator: NewsNavigator) {
        self.navigator = navigator
    }

    func getMostSharedNews(completion: @escaping ([Result]?) -> Void) {
        AlamofireNetwork.getNews(filterType: APIEndpoint.getSharedNews.stringValue ) { news in
            completion(news.results ?? [])
        }
    }

    func pushDetailNewsVC(view: UIViewController, news: Result) {
        navigator.pushDetailNewsVC(from: view, news: news)
    }

}
