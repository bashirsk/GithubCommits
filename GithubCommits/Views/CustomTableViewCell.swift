//
//  CustomTableViewCell.swift
//  GithubCommits
//
//  Created by Bashir Sentongo on 12/08/2018.
//  Copyright © 2018 Bashir Sentongo. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    // MARK:- Labels
    /**
     - Set our label textcolor to white when the views load up
     */
    
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
    
    /**
     - Populate label wit data fecthed from the Github API
     */
    
    var root: Root! {
        didSet {
            authorNameLabel.text = root.commit.author.name
            commitTitleLabel.text = root.commit.message
            dateFormatter()
            loadImage()
        }
    }
    
    /**
     - Format our date fetched from the Github API
     - Convert date to a string to enable populate the time label view since it
     outputs text which is a string
     */
    
    private func dateFormatter() {
        guard let myDate = root.commit.author.date else { return }
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: Identifiers.UKLocale.rawValue)
        dateFormatter.dateFormat = DateFormat.format.rawValue
        let date = dateFormatter.string(from: myDate)
        timeLabel.text = date
    }
    
    /**
     - Download author images from the Github API
     - Update the label and run it on the main thread
     */
    
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
