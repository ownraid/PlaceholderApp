//
//  DetailsViewModel.swift
//  PlaceholderApp
//
//  Created by Own on 02/08/2026.
//

import Foundation

final class DetailsViewModel {
    
    private let network = NetworkManager.shared
    
    var post: Post?
    var todo: Todo?
    var user: User?
    
    var comments: [Comment] = []
    
    var onDataUpdated: (() -> Void)?
    var onError: ((NetworkError) -> Void)?
    
    
    func loadDetails(for detailsType: DetailsType) {
        
        switch detailsType {
            
        case .post(let post):
            
            self.post = post
            
            fetchComments(postId: post.id)
            
            
        case .todo(let todo):
            
            self.todo = todo
            
            onDataUpdated?()
            
            
        case .user(let user):
            
            self.user = user
            
            onDataUpdated?()
        }
    }
    
    
    private func fetchComments(postId: Int) {
        
        network.fetchComments(postId: postId) { [weak self] result in
            
            switch result {
                
            case .success(let comments):
                
                self?.comments = comments
                self?.onDataUpdated?()
                
                
            case .failure(let error):
                self?.onError?(error)
            }
        }
    }
}
