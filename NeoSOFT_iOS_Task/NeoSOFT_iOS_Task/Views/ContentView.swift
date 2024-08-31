//
//  ContentView.swift
//  NeoSOFT_iOS_Task
//
//  Created by Lakshmipathi MacM1 on 31/08/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MainViewModel(
        items: ["apple", "banana", "orange", "blueberry"],
        carouselImages: ["image1", "image2", "image3", "image4"] // Dynamic carousel images
    )
    @State private var showStatistics = false

    var body: some View {
        ZStack {
            MainView(viewModel: viewModel)

            VStack {
                Spacer()
                HStack {
                    Spacer()
                    FloatingActionButton(showStatistics: $showStatistics)
                }
            }

            if showStatistics {
                VStack {
                    Spacer()
                    StatisticsDialog(items: viewModel.filteredItems)
                }
                .background(Color.black.opacity(0.4).edgesIgnoringSafeArea(.all))
                .onTapGesture {
                    showStatistics.toggle()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
