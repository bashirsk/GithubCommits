//
//  NetworkManager.swift
//  GithubCommits
//
//  Created by Bashir Sentongo on 12/08/2018.
//  Copyright © 2018 Bashir Sentongo. All rights reserved.
//

import Foundation
import UIKit

class NetworkManager: APIClient {
    
    static let shared = NetworkManager()
    
    
    func getGitCommits(completionHandler: @escaping NetworkManager.completionBlock) {
        let urlString = "https://api.github.com/repos/apple/swift/commits"
        guard let url = URL(string: urlString) else {
            print("Couldn't fetch JSON")
            return
        }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            guard data != nil && error == nil else {
                print(data ?? "")
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let result = try decoder.decode([Root].self, from: data!)
                result.forEach{
                    print("Name: \($0.commit.author.name)")
//                    print("Date: \($0.commit.author.date)")
//                    print("Avatar: \($0.author.avatar)")
//                    print("Commit Message: \($0.commit.message) \n")
                    completionHandler(result)
                }
            } catch let decodeError {
                print("Failed to decode json:", decodeError)
            }
        }
        dataTask.resume()
    }
}
