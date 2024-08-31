//
//  FloatingActionButton.swift
//  NeoSOFT_iOS_Task
//
//  Created by Lakshmipathi MacM1 on 31/08/24.
//

import SwiftUI

struct FloatingActionButton: View {
    @Binding var showStatistics: Bool

    var body: some View {
        Button(action: {
            withAnimation {
                showStatistics.toggle()
            }
        }) {
            Image(systemName: "plus")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .clipShape(Circle())
                .shadow(radius: 10)
        }
        .padding()
        .accessibility(label: Text("Toggle Statistics"))
    }
}
