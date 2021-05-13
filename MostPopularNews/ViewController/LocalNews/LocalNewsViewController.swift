//
//  LocalNewsViewController.swift
//  MostPopularNews
//
//  Created by Developer on 12.05.2021.
//

import UIKit


final class LocalNewsViewControllerImpl: UIViewController {

    private var presenter: LocalNewsPresenterImpl
    var favorite: Favorite

    @IBOutlet weak var newsHeadTitle: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var updatedLabel: UILabel!

    init(favorite: Favorite, presenter: LocalNewsPresenterImpl) {
        self.favorite = favorite
        self.presenter = presenter
        super.init(nibName: "LocalNewsViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
}

extension LocalNewsViewControllerImpl {
    func setupUI() {
        newsHeadTitle.text = favorite.newsHeadTitle
        sourceLabel.text = "Source: " + (favorite.source ?? "-")
        sectionLabel.text = "Section: " + (favorite.section ?? "-")
        updatedLabel.text = "Updated: " + (favorite.update ?? "-")
    }
}


