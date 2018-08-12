//
//  CustomTableViewCell.swift
//  GithubCommits
//
//  Created by Bashir Sentongo on 12/08/2018.
//  Copyright © 2018 Bashir Sentongo. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var authorNameLabel: UILabel! {
        didSet {
            authorNameLabel.textColor = .white
        }
    }
    @IBOutlet weak var timeLabel: UILabel! {
        didSet {
            timeLabel.textColor = .white
        }
    }
    @IBOutlet weak var commitTitleLabel: UILabel! {
        didSet {
            commitTitleLabel.textColor = .white
        }
    }
    @IBOutlet weak var authorImageView: UIImageView!
    
    var root: Root! {
        didSet {
            authorNameLabel.text = root.commit.author.name
            commitTitleLabel.text = root.commit.message
            dateFormatter()
            loadImage()
        }
    }
    
    private func dateFormatter() {
        guard let myDate = root.commit.author.date else { return }
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: Identifiers.UKLocale.rawValue)
        dateFormatter.dateFormat = DateFormat.format.rawValue
        let date = dateFormatter.string(from: myDate)
        timeLabel.text = date
    }
    
    private func loadImage() {
        guard let url = URL(string: root.author.avatar ?? "") else { return }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.authorImageView.image = UIImage(data: data)
            }
        }
        dataTask.resume()
    }
}
