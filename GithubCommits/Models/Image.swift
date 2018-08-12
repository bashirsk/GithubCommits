//
//  AuthorImage.swift
//  GithubCommits
//
//  Created by Bashir Sentongo on 12/08/2018.
//  Copyright © 2018 Bashir Sentongo. All rights reserved.
//

import Foundation

struct Image: Codable {
    let avatar: String?
    
    /**
     - Use coding key to get avatar that exists inform a snakecase.
     - Convert it to variable avator as seen above
     */
    private enum CodingKeys: String, CodingKey {
        case avatar = "avatar_url"
    }
}
