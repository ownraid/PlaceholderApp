//
//  Post.swift
//  PlaceholderApp
//
//  Created by Own on 03/08/2026.
//

import Foundation
struct Post : Decodable , Sendable{
    let userId : Int?
    let id     : Int
    let title  : String?
    let body   : String?
}
