//
//  DetailNewsViewController.swift
//  MostPopularNews
//
//  Created by Developer on 11.05.2021.
//

import UIKit


final class DetailNewsViewControllerImpl: UIViewController {

    @IBOutlet weak var newsHeadTitle: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var updatedLabel: UILabel!


    private var presenter: DetailNewsPresenterImpl

    var news: Result

    init(news: Result, presenter: DetailNewsPresenterImpl) {
        self.news = news
        self.presenter = presenter
        super.init(nibName: "DetailNewsViewControlleImplr", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFavorite))
        addButton.image = UIImage(systemName: "heart")
        self.navigationItem.rightBarButtonItem = addButton
        setupUI()
    }
}

extension DetailNewsViewControllerImpl {
    func setupUI() {
        newsHeadTitle.text = news.title
        sourceLabel.text = "Source: " + (news.source ?? "-")
        sectionLabel.text = "Section: " + (news.section ?? "-")
        updatedLabel.text = "Updated: " + (news.updated ?? "-")
    }

    @objc func addFavorite() {
        let addFavorite = FavoriteData()
        addFavorite.saveFavoriteData(newsHeadTitle: news.title, source: news.source, section: news.updated, update: news.updated)
    }
}

