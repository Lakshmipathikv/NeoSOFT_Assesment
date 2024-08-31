//
//  StatisticsDialog.swift
//  NeoSOFT_iOS_Task
//
//  Created by Lakshmipathi MacM1 on 31/08/24.
//

import SwiftUI

struct StatisticsDialog: View {
    let items: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Statistics")
                .font(.headline)

            Text("Total Items: \(items.count)")

            let charCount = MainViewModel(items: items).calculateCharacterOccurrences()
            ForEach(charCount.prefix(3), id: \.key) { char, count in
                Text("\(char) = \(count)")
            }

            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 10)
        .padding()
    }
}
