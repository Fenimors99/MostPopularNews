//
//  FavoriteNewsPresenter.swift
//  MostPopularNews
//
//  Created by Developer on 11.05.2021.
//

import UIKit

protocol FavoriteNewsPresenter {
    func pushLocalNews(view: UIViewController, favorite: Favorite)
}

final class FavoriteNewsImpl: FavoriteNewsPresenter {

    let navigator: NewsNavigator

    init(navigator: NewsNavigator) {
        self.navigator = navigator
    }

    func pushLocalNews(view: UIViewController, favorite: Favorite) {
        navigator.pushLocalNews(from: view, favorite: favorite)
    }


}
