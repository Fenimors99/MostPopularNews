//
//  FavoriteNewsViewController.swift
//  MostPopularNews
//
//  Created by Developer on 11.05.2021.
//

import UIKit

class FavoriteNewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var news: [Favorite]?
    private var presenter: FavoriteNewsPresenter!
    let data = FavoriteData()

    init(presenter: FavoriteNewsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        reload()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.news?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath)
            as! NewsCell
        let favorite = self.news?[indexPath.row]
        cell.newsTitle.text = favorite?.newsHeadTitle
        return cell
    }

    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
        self.title = "favorite"
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        guard let favorite = news?[indexPath.row] else { return }
        presenter.pushLocalNews(view: self, favorite: favorite)
    }

    func reload() {
        data.fetchFavorite(tableView: tableView)
        news = data.favorites
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { [self] (action, view, comletionHandler) in
            let cellToRemove = news![indexPath.row]
            data.remove(cellToRemove: cellToRemove)
            reload()
            news = data.favorites

        }
        return UISwipeActionsConfiguration(actions: [action])
    }
}
