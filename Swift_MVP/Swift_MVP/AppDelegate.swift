//
//  AppDelegate.swift
//  Swift_MVP
//
//  Created by Umut SERIFLER on 22/01/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            let presenter = GitHubPresenter(GithubAPIProvider())
            let viewController = GitHubViewController(presenter: presenter)            
            window.rootViewController = UINavigationController(rootViewController: viewController)
            window.makeKeyAndVisible()
        }
        return true
    }

}

