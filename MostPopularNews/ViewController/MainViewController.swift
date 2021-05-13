//
//  ViewController.swift
//  MostPopularNews
//
//  Created by Developer on 07.05.2021.
//

import UIKit

class MainViewController: UIViewController, UITabBarControllerDelegate {

    private var embedTabBarVC: UITabBarController = UITabBarController()

    private lazy var mostEmailedVC: UINavigationController = instantiateMostEmailedVC()
    private lazy var viewedVC: UINavigationController = instantiateViewedVC()
    private lazy var shareVC: UINavigationController = instantiateSharedVC()
    private lazy var favoriteVC: UINavigationController = instantiateFavoriteVC()

    private let navigator: NewsNavigator

    init(navigator: NewsNavigator) {
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialSetup()
    }    
}

extension MainViewController {


    func setupTabBarController() -> UITabBarController {
        let tabBar = UITabBarController()
        let item = UITabBarItem()
        item.title = "Home"
        item.image = UIImage(named: "pencil")
        viewedVC.tabBarItem = item

        shareVC.tabBarItem = item
        tabBar.viewControllers = [mostEmailedVC, viewedVC, shareVC, favoriteVC]
        tabBar.selectedIndex = 3

        return tabBar
    }

    func initialSetup() {

        view.backgroundColor = .white
        embedTabBarVC.delegate = self
        embedTabBarVC.viewControllers = [mostEmailedVC, shareVC, viewedVC, favoriteVC]
        embedTabBarVC.tabBar.isTranslucent = false
        embedTabBarVC.tabBar.unselectedItemTintColor = UIColor.gray
        addChild(embedTabBarVC, toContainer: view)
    }

    func setSelectedIndex(index: Int) {
        self.embedTabBarVC.selectedIndex = index
    }

    func instantiateMostEmailedVC() -> UINavigationController {
        let navigator = NewsNavigatorImpl()
        let presenter = MostEmailedPresenterImpl(navigator: navigator)
        let vc: MostEmailedViewController = MostEmailedViewController(presenter: presenter)
        let navigationVC = UINavigationController(rootViewController: vc)
        vc.tabBarItem = UITabBarItem(
            title: "emailed", image: UIImage(systemName: "paperplane"), selectedImage: UIImage(systemName: "paperplane")
        )
        return navigationVC
    }

    func instantiateViewedVC() -> UINavigationController {
        let navigator = NewsNavigatorImpl()
        let presenter = MostViewedPresenterImpl(navigator: navigator)
        let vc: MostViewedViewController = MostViewedViewController(presenter: presenter)
        let navigationVC = UINavigationController(rootViewController: vc)
        vc.tabBarItem = UITabBarItem(
            title: "viewed", image: UIImage(systemName: "globe"), selectedImage: UIImage(systemName: "globe")
        )
        return navigationVC

    }

    func instantiateSharedVC() -> UINavigationController {
        let navigator = NewsNavigatorImpl()
        let presenter = MostSharedPresenterImpl(navigator: navigator)
        let vc: MostSharedViewController = MostSharedViewController(presenter: presenter)
        let navigationVC = UINavigationController(rootViewController: vc)
        vc.tabBarItem = UITabBarItem(
            title: "share", image: UIImage(systemName: "mail.stack"), selectedImage: UIImage(systemName: "mail.stack")
        )
        return navigationVC
    }

    func instantiateFavoriteVC() -> UINavigationController {
        let navigator = NewsNavigatorImpl()
        let presenter = FavoriteNewsImpl(navigator: navigator)
        let vc: FavoriteNewsViewController = FavoriteNewsViewController(presenter: presenter)
        let navigationVC = UINavigationController(rootViewController: vc)
        vc.tabBarItem = UITabBarItem(
            title: "favorite", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart")
        )
        return navigationVC
    }

}
