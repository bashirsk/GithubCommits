//
//  APIClient.swift
//  GithubCommits
//
//  Created by Bashir Sentongo on 12/08/2018.
//  Copyright © 2018 Bashir Sentongo. All rights reserved.
//

import Foundation

protocol APIClient {
    //typealias completionBlock = (([Root])->())
    
    func getGitCommits()
}



