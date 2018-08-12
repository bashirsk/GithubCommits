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
        initialize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        networkManager()
    }
    
    private func initialize() {
        setUpTableView()
        registerNib()
        navigation()
    }
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.backgroundColor = .darkslategray
    }
    
    private func navigation() {
        navigationController?.navigationBar.barTintColor = .darkslategray
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    private func registerNib() {
        let nib = UINib(nibName: Nibs.CustomCell.rawValue, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Identifiers.Cell.rawValue)
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

