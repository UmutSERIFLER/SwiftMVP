//
//  GitHubSearchResponseModel.swift
//  Swift_MVP
//
//  Created by Umut SERIFLER on 22/01/2021.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let gitHubSearchResponseModel = try? newJSONDecoder().decode(GitHubSearchResponseModel.self, from: jsonData)

import Foundation

// MARK: - GitHubSearchResponseModel
struct GitHubSearchResponseModel: Decodable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

// MARK: - Item
struct Item: Decodable {
    let id: Int
    let node_id, name, full_name: String
    let `private`: Bool
    let owner: Owner
    let html_url: String
    let description: String?
    let fork: Bool
    let url: String
    let forks_url: String
    let keys_url, collaborators_url: String
    let teams_url, hooks_url: String
    let issue_events_url: String
    let events_url: String
    let assignees_url, branches_url: String
    let tags_url: String
    let blobs_url, git_tags_url, git_refs_url, trees_url: String
    let statuses_url: String
    let languages_url, stargazers_url, contributors_url, subscribers_url: String
    let subscription_url: String
    let commits_url, git_commits_url, comments_url, issue_comment_url: String
    let contents_url, compare_url: String
    let merges_url: String
    let archive_url: String
    let downloads_url: String
    let issues_url, pulls_url, milestones_url, notifications_url: String
    let labels_url, releases_url: String
    let deployments_url: String
    let created_at, updated_at, pushed_at: String
    let git_url, ssh_url: String
    let clone_url: String
    let svn_url: String
    let homepage: String?
    let size, stargazers_count, watchers_count: Int
    let language: String?
    let has_issues, has_projects, has_downloads, has_wiki: Bool
    let has_pages: Bool
    let forks_count: Int
    let archived, disabled: Bool
    let open_issues: Int
    let license: License?
    let forks, open_issues_count, watchers: Int
    let default_branch: String?
    let score: Int
}

// MARK: - License
struct License: Decodable {
    let key, name, spdx_id: String
    let url: String?
    let node_id: String
}

// MARK: - Owner
struct Owner: Decodable {
    let login: String
    let id: Int
    let node_id: String
    let avatar_url: String
    let gravatar_id: String
    let url, html_url, followers_url: String
    let following_url, gists_url, starred_url: String
    let subscriptions_url, organizations_url, repos_url: String
    let events_url: String
    let received_events_url: String
    let site_admin: Bool
}

