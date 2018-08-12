//
//  GitCommitsController.swift
//  GithubCommits
//
//  Created by Bashir Sentongo on 12/08/2018.
//  Copyright © 2018 Bashir Sentongo. All rights reserved.
//

import UIKit

class GitCommitsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       NetworkManager.shared.getGitCommits()
    }
    
    private func setUpTableView() {
        
    }
    

}

