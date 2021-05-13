//
//  FavoriteData.swift
//  MostPopularNews
//
//  Created by Developer on 12.05.2021.
//
import UIKit
import CoreData

protocol FavoriteDataProtocol {
    func saveFavoriteData(newsHeadTitle: String?, source: String?, section: String?, update: String?)
    func fetchFavorite(tableView: UITableView)
    func remove(cellToRemove: Favorite)

}

class FavoriteData: FavoriteDataProtocol {
    var favorites: [Favorite]?
    let context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func saveFavoriteData(newsHeadTitle: String?, source: String?, section: String?, update: String?) {
        let newFavorite = Favorite(context: self.context)
        newFavorite.newsHeadTitle = newsHeadTitle
        newFavorite.source = source
        newFavorite.section = section
        newFavorite.update = update
        do {
            try self.context.save()
        }
        catch {
            print("Error")
        }
    }

    func fetchFavorite(tableView: UITableView) {
        do {
            let request = Favorite.fetchRequest()  as NSFetchRequest<Favorite>
            self.favorites = try context.fetch(request)
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }
        catch {
            print("Error")
        }
    }

    func remove(cellToRemove: Favorite) {
        self.context.delete(cellToRemove)

        do {
            try self.context.save()
        }
        catch {
            print("Error")
        }
    }
}
