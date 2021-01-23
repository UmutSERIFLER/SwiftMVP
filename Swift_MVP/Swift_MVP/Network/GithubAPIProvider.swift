//
//  GithubAPIProvider.swift
//  Swift_MVP
//
//  Created by Umut SERIFLER on 22/01/2021.
//

import Foundation

protocol GitHubAPIProviderProtocol {
    func searchRepositories(name: String, completionHandler: @escaping (Result<GitHubSearchResponseModel, NSError>) -> ())
}

/// GitHub API Provider
struct GithubAPIProvider: GitHubAPIProviderProtocol {
    
    private let session = URLSession.shared
    /// Search repositories using taken string
    /// - Parameters:
    ///   - name: Repository Name
    ///   - completionHandler: Result Handler (<GitHubSearchResponseModel, GitHubErrorResponseModel>)
    /// - Returns: nil
    func searchRepositories(name: String, completionHandler: @escaping (Result<GitHubSearchResponseModel, NSError>) -> ()) {
        let request = URLRequest(url: URL(string: "https://api.github.com/search/repositories?q=\(name)")!)
        let task = session.dataTask(with: request) { (data, _, _) in
            guard let data = data,
                  let response = try? JSONDecoder().decode(GitHubSearchResponseModel.self, from: data) else {
                completionHandler(.failure(NSError()))
                return
            }
            completionHandler(.success(response))
        }
        task.resume()
    }
    
    
}

