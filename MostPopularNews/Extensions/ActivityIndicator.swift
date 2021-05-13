//
//  ActivityIndicator.swift
//  MostPopularNews
//
//  Created by Developer on 11.05.2021.
//

import UIKit

extension UIViewController {

    func showActivityIndicator() {
        let activityIndicatorView: UIActivityIndicatorView = UIActivityIndicatorView(style: .medium)
        activityIndicatorView.frame = view.bounds
        activityIndicatorView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
    }

    func hideActivityIndicatorView() {
        if let activityIndicator: UIView = view.subviews.first(where: {$0 is UIActivityIndicatorView}) {
            activityIndicator.removeFromSuperview()
        }
    }

}
