//
//  NetworkManager.swift
//  GithubCommits
//
//  Created by Bashir Sentongo on 12/08/2018.
//  Copyright © 2018 Bashir Sentongo. All rights reserved.
//

import Foundation
import UIKit

class APIManager {
    
    /**
     - Conform to the protocol with a completion handler we can use to pass data back to the
     viewcontroller
     - Check the url if its nil using guard rather than force unwrapping, there by the app won't crash
     when users are using it
     - Create a JSON object and decode our commit fetched from the internet inform of type data 
     */
    func getGitCommits(completionHandler: @escaping ([Root])->()) {
        let urlString = URLS.URL.rawValue
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
