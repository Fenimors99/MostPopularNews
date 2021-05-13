//
//  DetailNewsPresenter.swift
//  MostPopularNews
//
//  Created by Developer on 11.05.2021.
//

import UIKit

protocol DetailNewsProtocol: class {
    
}

final class DetailNewsPresenterImpl {

    let navigator: NewsNavigatorImpl

    init(navigator: NewsNavigatorImpl) {
        self.navigator = navigator
    }
}
