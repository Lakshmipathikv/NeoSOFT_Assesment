//
//  MainViewModel.swift
//  NeoSOFT_iOS_Task
//
//  Created by Lakshmipathi MacM1 on 31/08/24.
//

import Foundation

class MainViewModel: BaseViewModel {
    @Published var items: [String] = [] // Dynamic item list
    @Published var filteredItems: [String] = []
    @Published var carouselImages: [String] // Dynamic carousel images
    
    @Published var searchText: String = "" {
        didSet {
            filterItems()
        }
    }
    
    private let itemService: ItemServiceProtocol
    
    // Initialize with dynamic arrays for items and carousel images
    init(items: [String] = [], carouselImages: [String] = [], itemService: ItemServiceProtocol = ItemService()) {
        self.items = items
        self.filteredItems = items
        self.carouselImages = carouselImages
        self.itemService = itemService
    }
    
    func filterItems() {
        self.isLoading = true
        do {
            filteredItems = itemService.filterItems(items,
                                                    searchText: searchText)
        } catch {
            handleError(error)
        }
        self.isLoading = false
    }
    
    func updateItemsBasedOnCarousel(index: Int) {
        self.isLoading = true
        do {
            items = itemService.updateItemsBasedOnCarousel(index: index)
            filterItems()
        } catch {
            handleError(error)
        }
        self.isLoading = false
    }
    
    func calculateCharacterOccurrences() -> [(key: Character, value: Int)] {
        return itemService.calculateCharacterOccurrences(in: filteredItems)
    }
    
    // Handle errors and set the error message
    private func handleError(_ error: Error) {
        self.errorMessage = error.localizedDescription
        self.isLoading = false
    }
}
