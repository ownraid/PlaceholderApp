//
//  MainViewModel.swift
//  PlaceholderApp
//
//  Created by Own on 31/07/2026.
//

import Foundation
class mainViewModel {
    let store = MainStore()
    
    func numberOfItems() -> Int {
            return store.items.count
        }
    func item(at index: Int) -> mainMenuItem {
            return store.items[index]
        }
    
    
}

