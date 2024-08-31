//
//  SearchBarView.swift
//  NeoSOFT_iOS_Task
//
//  Created by Lakshmipathi MacM1 on 31/08/24.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String

    var body: some View {
        TextField("Search...", text: $searchText)
            .padding(8)
            .background(Color(.systemGray5))
            .cornerRadius(8)
    }
}
