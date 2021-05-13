//
//  NewsCell.swift
//  MostPopularNews
//
//  Created by Developer on 07.05.2021.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var newsTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

}

extension NewsCell {
    @discardableResult
    func configure(with model: Result) -> UITableViewCell {
        newsTitle.text = model.title

        return self
    }
}
