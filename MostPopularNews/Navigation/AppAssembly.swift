//
//  AppAssembly.swift
//  MostPopularNews
//
//  Created by Developer on 11.05.2021.
//

import UIKit

class AppAssembly: NSObject {

    func detailNewsViewController(navigator: NewsNavigatorImpl, news: Result) -> UIViewController {
        let presenter = DetailNewsPresenterImpl(navigator: navigator)
        let viewController = DetailNewsViewControllerImpl(news: news, presenter: presenter)
        return viewController
    }

    func localNewsViewController(navigator: NewsNavigatorImpl, favorite: Favorite) -> UIViewController {
        let presenter = LocalNewsPresenterImpl(navigator: navigator)
        let viewController = LocalNewsViewControllerImpl(favorite: favorite, presenter: presenter)
        return viewController
    }
}
