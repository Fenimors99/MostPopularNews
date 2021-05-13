//
//  ViewController + Child.swift
//  MostPopularNews
//
//  Created by Developer on 07.05.2021.
//

import UIKit

// MARK: - Child management
extension UIViewController {

    func addChild(_ child: UIViewController, toContainer container: UIView) {

        addChild(child)

        child.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        child.view.frame = container.bounds
        container.addSubview(child.view)

        child.didMove(toParent: self)
    }

    func removeChild(_ child: UIViewController) {

        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
}
