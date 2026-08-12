//
//  APIEndPoint.swift
//  PlaceholderApp
//
//  Created by Own on 03/08/2026.
//

import Foundation

enum APIEndpoints {

    static let baseURL = "https://jsonplaceholder.typicode.com"

    case posts
    case users
    case todos
    case comments(postId: Int)

    var url: String { // Computed Property

        switch self {

        case .posts:
            return Self.baseURL + "/posts"

        case .users:
            return Self.baseURL + "/users"

        case .todos:
            return Self.baseURL + "/todos"

        case .comments(let postId):  // Associated Value
            return Self.baseURL + "/posts/\(postId)/comments"
        }
    }
}

/*
 //calss APIEndPoint
enum APIEndPoint {
    static let posts = "https://jsonplaceholder.typicode.com/posts"
    static let users = "https://jsonplaceholder.typicode.com/users"
    static let todos = "https://jsonplaceholder.typicode.com/todos"
    static func comments(postId: Int) -> String {
        return "https://jsonplaceholder.typicode.com/posts/\(postId)/comments"
    
 //private init(){}
 }
 */
