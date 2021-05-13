//
//  MostViewedViewController.swift
//  MostPopularNews
//
//  Created by Developer on 07.05.2021.
//

import UIKit

class MostViewedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    private var presenter: MostViewedPresenter!

    var allNews: [Result]?

    init(presenter: MostViewedPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        showActivityIndicator()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getMostViewedNews(completion: { [weak self] news in
            self?.allNews = news
            self?.hideActivityIndicatorView()
            self?.tableView.reloadData()
        })
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allNews?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let news = (allNews?[indexPath.item])
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath)
            as? NewsCell
        cell?.newsTitle.text = news?.title
        return cell!
    }

    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
        setupNavigationController()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        guard let news = allNews?[indexPath.row] else { return }
        presenter.pushDetailNewsVC(view: self, news: news)
    }

    func setupNavigationController() {
        navigationItem.title = "News"
    }

    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let favourite = favouriteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [favourite])
    }

    func favouriteAction(at indexPath: IndexPath) -> UIContextualAction {
        let news = allNews?[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "Favorite") { (action, view, completion) in
            let saveNewFavorite = FavoriteData()
            saveNewFavorite.saveFavoriteData(newsHeadTitle: news?.title , source: news?.source, section: news?.section, update: news?.updated)
            saveNewFavorite.fetchFavorite(tableView: self.tableView)
            self.message(new: news?.title)
            completion(true)
        }
        action.image = UIImage(systemName: "heart")

        return action
    }

    func message(new: String?){
        let alert = UIAlertController(title: new, message: "saved", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

