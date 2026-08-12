//
//  DataViewModel.swift
//  PlaceholderApp
//
//  Created by Own on 02/08/2026.
//

import Foundation

final class DataViewModel {

    private let network = NetworkManager.shared

    var posts: [Post] = []
    var users: [User] = []
    var todos: [Todo] = []

    var onDataUpdated: (() -> Void)?
    var onError: ((NetworkError) -> Void)?

    func fetchData(for dataType: DataType) {

        switch dataType {

        case .posts:
            fetchPosts()

        case .users:
            fetchUsers()

        case .todos:
            fetchTodos()
        }
    }

    private func fetchPosts() {

        network.fetchPosts { [weak self] result in

            switch result {

            case .success(let posts):

                self?.posts = posts
                self?.onDataUpdated?()

            case .failure(let error):

                self?.onError?(error)
            }
        }
    }

    private func fetchUsers() {

        network.fetchUsers { [weak self] result in

            switch result {

            case .success(let users):

                self?.users = users
                self?.onDataUpdated?()

            case .failure(let error):

                self?.onError?(error)
            }
        }
    }

    private func fetchTodos() {

        network.fetchTodos { [weak self] result in

            switch result {

            case .success(let todos):

                self?.todos = todos
                self?.onDataUpdated?()

            case .failure(let error):

                self?.onError?(error)
            }
        }
    }
}
