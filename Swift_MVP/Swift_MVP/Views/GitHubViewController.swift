//
//  GitHubViewController.swift
//  Swift_MVP
//
//  Created by Umut SERIFLER on 22/01/2021.
//

import UIKit

class GitHubViewController: UIViewController {
    
    private var data: [Item]?
    private let tableView = UITableView()
    private let searchController = UISearchController(searchResultsController: nil)
    private let repositoryPresenter: GitHubPresenter?
    
    init(presenter: GitHubPresenter = GitHubPresenter()) {
        self.repositoryPresenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        definesPresentationContext = true
        self.repositoryPresenter?.githubPresenter = self
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        repositoryPresenter?.getRepositories(name: "umut")
    }
    
    private func showMessage(_ message: String?) {
        guard let message = message else { return }
        let alertController = UIAlertController(title: "\(message)", message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
}

extension GitHubViewController: ViewProtocol {
    func updateLoadingStatusClosure(isLoading: Bool) {
        DispatchQueue.main.async { 
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
        }
    }
    
    func updateRepositories(response: Decodable?) {
        DispatchQueue.main.async { [weak self] in
            self?.data = response as? [Item]
            self?.tableView.reloadData()
        }
    }
    
    func showAlert(message: String?) {
        DispatchQueue.main.async { [weak self] in
            guard let validErrorMessage = message else { return }
            self?.showMessage(validErrorMessage)
        }
    }
    
}

extension GitHubViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = data else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].name
        return cell
    }
}

extension GitHubViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let data = data else { return }
        self.showMessage(data[indexPath.row].url)
    }
}

extension GitHubViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        view.isHidden = false
        self.repositoryPresenter?.getRepositories(name: searchController.searchBar.text ?? "")
    }
}
