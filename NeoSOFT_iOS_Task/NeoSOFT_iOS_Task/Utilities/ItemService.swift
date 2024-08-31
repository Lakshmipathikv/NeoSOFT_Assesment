//
//  ItemService.swift
//  NeoSOFT_iOS_Task
//
//  Created by Lakshmipathi MacM1 on 31/08/24.
//

import Foundation

protocol ItemServiceProtocol {
    func filterItems(_ items: [String], 
                     searchText: String) -> [String]
    func updateItemsBasedOnCarousel(index: Int) -> [String]
    func calculateCharacterOccurrences(in items: [String]) -> [(key: Character, 
                                                                value: Int)]
}

class ItemService: ItemServiceProtocol {
    
    func filterItems(_ items: [String],
                     searchText: String) -> [String] {
        if searchText.isEmpty {
            return items
        } else {
            //return items.filter { $0.contains(searchText) }
            return items.filter { $0.localizedCaseInsensitiveContains(searchText) }
            
        }
    }
    
    func updateItemsBasedOnCarousel(index: Int) -> [String] {
        return ["apple",
                "banana",
                "orange",
                "blueberry"].map { "\($0) \(index)" }
    }
    
    func calculateCharacterOccurrences(in items: [String]) -> [(key: Character,
                                                                value: Int)] {
        let joinedString = items.joined()
        let charCount = Dictionary(joinedString.filter { $0.isLetter }.map { ($0, 1) },
                                   uniquingKeysWith: +)
        return charCount.sorted { $0.value > $1.value }
    }
}
