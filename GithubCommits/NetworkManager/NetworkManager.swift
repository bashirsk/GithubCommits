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
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let result = try decoder.decode([Root].self, from: data)
                result.forEach({ (root) in
                    completionHandler(result)
                })
            } catch let decodeError {
                print("Failed to decode json:", decodeError)
            }
        }
        dataTask.resume()
    }
}
