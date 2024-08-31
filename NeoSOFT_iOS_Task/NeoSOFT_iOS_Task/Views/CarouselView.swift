//
//  CarouselView.swift
//  NeoSOFT_iOS_Task
//
//  Created by Lakshmipathi MacM1 on 31/08/24.
//

import SwiftUI

struct CarouselView: View {
    let images: [String] // Dynamic image list
    let onPageChanged: (Int) -> Void
    
    var body: some View {
        TabView {
            ForEach(images.indices, id: \.self) { index in
                Image(images[index])
                    .resizable()
                    .scaledToFit()
                    .onTapGesture {
                        onPageChanged(index)
                    }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 200) // Height of the carousel, can be made dynamic as well
    }
}

//#Preview {
//    CarouselView(images: Image)
//}
