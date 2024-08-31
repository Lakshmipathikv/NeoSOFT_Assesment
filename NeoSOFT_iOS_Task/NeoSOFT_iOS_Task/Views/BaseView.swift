//
//  BaseView.swift
//  NeoSOFT_iOS_Task
//
//  Created by Lakshmipathi MacM1 on 31/08/24.
//

import SwiftUI

struct BaseView<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

#Preview {
    BaseView {
           Text("Hello, World!")
       }
   }


