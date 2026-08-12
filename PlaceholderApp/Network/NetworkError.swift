//
//  NetworkError.swift
//  PlaceholderApp
//
//  Created by Own on 03/08/2026.
//

import Foundation
enum NetworkError: Error {
    case noInternet
    case decodingFailed
    case unknown
}
