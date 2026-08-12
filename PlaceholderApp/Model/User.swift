//
//  User.swift
//  PlaceholderApp
//
//  Created by Own on 03/08/2026.
//

import Foundation

struct User : Decodable, Sendable {
    let id        : Int?
    let name      : String?
    let username  : String?
    let email     : String?
    let address   : Address
    let phone     : String?
    let website   : String?
    let company   : Company
    
}
