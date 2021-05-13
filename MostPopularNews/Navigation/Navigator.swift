//
//  Navigation.swift
//  MostPopularNews
//
//  Created by Developer on 11.05.2021.
//

import UIKit

protocol NewsNavigator {
    func pushDetailNewsVC(from viewController: UIViewController, news: Result)
    func pushLocalNews(from viewController: UIViewController, favorite: Favorite)
}

class NewsNavigatorImpl: NewsNavigator {

    var appAssembly = AppAssembly()

    func pushDetailNewsVC(from viewController: UIViewController, news: Result) {
        let vc = appAssembly.detailNewsViewController(navigator: self, news: news)
        viewController.navigationController?.pushViewController(vc, animated: true)

    }

    func pushLocalNews(from viewController: UIViewController, favorite: Favorite) {
        let vc = appAssembly.localNewsViewController(navigator: self, favorite: favorite)
        viewController.navigationController?.pushViewController(vc, animated: true)

    }
}
