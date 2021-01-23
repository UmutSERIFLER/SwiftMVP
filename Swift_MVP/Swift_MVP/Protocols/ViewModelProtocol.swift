//
//  ViewModelProtocol.swift
//  Swift_MVP
//
//  Created by Umut SERIFLER on 22/01/2021.
//

import Foundation

protocol ViewProtocol: NSObjectProtocol {
    func updateRepositories(response: Decodable?)
    func showAlert(message: String?)
    func updateLoadingStatusClosure(isLoading: Bool)
}
