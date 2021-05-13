//
//  LocalNewsPresenter.swift
//  MostPopularNews
//
//  Created by Developer on 12.05.2021.
//

import UIKit

protocol LocalNewsProtocol: class {

}

final class LocalNewsPresenterImpl {

    let navigator: NewsNavigatorImpl

    init(navigator: NewsNavigatorImpl) {
        self.navigator = navigator
    }
}
