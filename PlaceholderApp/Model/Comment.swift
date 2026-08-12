//
//  Comment.swift
//  PlaceholderApp
//
//  Created by Own on 03/08/2026.
//

import Foundation

struct Comment : Decodable, Sendable{
    let postId : Int?
    let id     : Int?
    let name   : String?
    let email  : String?
    let body   : String?
}
