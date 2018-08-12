//
//  CustomTableViewCell.swift
//  GithubCommits
//
//  Created by Bashir Sentongo on 12/08/2018.
//  Copyright © 2018 Bashir Sentongo. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var commitTitleLabel: UILabel!
    @IBOutlet weak var authorImageView: UIImageView!
    
    var root: Root! {
        didSet {
            authorNameLabel.text = root.commit.author.name
            commitTitleLabel.text = root.commit.message
            dateFormatter()
        }
    }
    
    private func dateFormatter() {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss"
        let strDate = dateFormatter.string(from: date)
        timeLabel.text = strDate
    }
    
    private func loadImage() {
        guard let url = URL(string: root.author.avatar ?? "") else { return }
        
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
