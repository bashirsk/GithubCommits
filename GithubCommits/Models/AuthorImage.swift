//
//  AuthorImage.swift
//  GithubCommits
//
//  Created by Bashir Sentongo on 12/08/2018.
//  Copyright © 2018 Bashir Sentongo. All rights reserved.
//

import Foundation

struct AuthorImage: Codable {
    let avatar: String
    
    private enum CodingKeys: String, CodingKey {
        case avatar = "avatar_url"
    }
}
