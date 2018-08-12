//
//  GitCommitsController.swift
//  GithubCommits
//
//  Created by Bashir Sentongo on 12/08/2018.
//  Copyright © 2018 Bashir Sentongo. All rights reserved.
//

import UIKit

class GitCommitsController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var root = [Root]()

    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager()
        setUpTableView()
        registerNib()
    }
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.backgroundColor = UIColor(red: 41.0/255, green: 42.0/255, blue: 48.0/255, alpha: 1.0)
        navigationController?.navigationBar.barTintColor = UIColor(red: 41.0/255, green: 42.0/255, blue: 48.0/255, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    private func registerNib() {
        let nib = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
    }
    
    private func networkManager() {
        NetworkManager.shared.getGitCommits { (root) in
            self.root = root
            DispatchQueue.main.async {
                 self.tableView.reloadData()
            }
        }
    }
    

}

