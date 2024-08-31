//
//  MainView.swift
//  NeoSOFT_iOS_Task
//
//  Created by Lakshmipathi MacM1 on 31/08/24.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        BaseView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else {
                    SearchBarView(searchText: $viewModel.searchText)
                        .padding(.top)
                    
                    CarouselView(images: viewModel.carouselImages,
                                 onPageChanged: viewModel.updateItemsBasedOnCarousel)
                    List(viewModel.filteredItems, id: \.self)
                    { item in Text(item) }
                }
                
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
            }
        }
    }
}

//#Preview {
//    MainView()
//}
