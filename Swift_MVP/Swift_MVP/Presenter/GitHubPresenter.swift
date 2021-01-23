//
//  GitHubPresenter.swift
//  Swift_MVP
//
//  Created by Umut SERIFLER on 22/01/2021.
//

import Foundation

final class GitHubPresenter {
    
    
    private(set) var apiService : GitHubAPIProviderProtocol!
    weak var githubPresenter: ViewProtocol?
    
    var isLoading: Bool = false {
        didSet {
            self.githubPresenter?.updateLoadingStatusClosure(isLoading: isLoading)
        }
    }
    
    
    init(_ apiService: GitHubAPIProviderProtocol = GithubAPIProvider()) {
        self.apiService = apiService
    }
    
    func getRepositories(name: String?) {
        guard let searchWord = name, !searchWord.isEmpty else {
            self.githubPresenter?.updateRepositories(response: nil)
            return
        }
        isLoading = true
        apiService.searchRepositories(name: searchWord) { [weak self] (result) in
            self?.isLoading = false
            switch result {
            case .success(let response):
                self?.githubPresenter?.updateRepositories(response: response.items)
            case .failure(_):
                self?.githubPresenter?.showAlert(message: "Error")
            }
        }
    }
    
    
}
