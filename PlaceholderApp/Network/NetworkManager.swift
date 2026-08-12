//
//  NetworkManager.swift
//  PlaceholderApp
//
//  Created by Own on 03/08/2026.
//

import Foundation
import Alamofire

final class NetworkManager {
    static let shared = NetworkManager()
    private init(){}
    
    func fetchPosts(completion: @escaping (Result<[Post], NetworkError>) -> Void) {
        
        AF.request(APIEndpoints.posts.url)
            .responseDecodable(of: [Post].self) { response in
                
                switch response.result {
                    
                case .success(let posts):
                    completion(.success(posts))
                    
                case .failure(let error):
                    completion(.failure(self.errorType(error)))
                }
            }
    }
    
    func fetchUsers(completion: @escaping (Result<[User], NetworkError>) -> Void) {
        
        AF.request(APIEndpoints.users.url)
            .responseDecodable(of: [User].self) { response in
                
                switch response.result {
                    
                case .success(let users):
                    completion(.success(users))
                    
                case .failure(let error):
                    completion(.failure(self.errorType(error)))
                }
            }
    }
    
    func fetchTodos(completion: @escaping (Result<[Todo], NetworkError>) -> Void) {
        
        AF.request(APIEndpoints.todos.url)
            .responseDecodable(of: [Todo].self) { response in
                
                switch response.result {
                    
                case .success(let todos):
                    completion(.success(todos))
                    
                case .failure(let error):
                    completion(.failure(self.errorType(error)))
                }
            }
    }
    
    func fetchComments(
        postId: Int,
        completion: @escaping (Result<[Comment], NetworkError>) -> Void
    ) {
        
        AF.request(APIEndpoints.comments(postId: postId).url)
            .responseDecodable(of: [Comment].self) { response in
                
                switch response.result {
                    
                case .success(let comments):
                    completion(.success(comments))
                    
                case .failure(let error):
                    completion(.failure(self.errorType(error)))
                }
            }
    }
    
    private func errorType(_ error: AFError) -> NetworkError {
        
        switch error {
        case .sessionTaskFailed(let subError) :
            
            if let urlError = subError as? URLError {
                
                switch urlError.code {
                    
                case .notConnectedToInternet, .networkConnectionLost :
                    return .noInternet
                    
                default:
                    return .unknown
                }
            }
            
            return .unknown
            
        case .responseSerializationFailed :
            return .decodingFailed
            
        default:
            return .unknown
        }
    }
    
}
    
    
    
    














    
    /*
    func request<T: Decodable>(completion: @escaping (Result<T, NetworkError>) -> Void){
             AF.request(APIEndpoints.T.url).responseDecodable(of: T.self) { response in
                     
                     switch response.result {
                         
                     case .success(let data):
                         completion(.success(data))
                         
                     case .failure:
                         completion(.failure(.unknown))
                     }
             }
    }
    
     

     */

