//
//  Address.swift
//  PlaceholderApp
//
//  Created by Own on 03/08/2026.
//

import Foundation

struct Address : Decodable{
    let street  : String?
    let suite   : String?
    let city    : String?
    let zipcode : String?
    let geo     : Geo
}
