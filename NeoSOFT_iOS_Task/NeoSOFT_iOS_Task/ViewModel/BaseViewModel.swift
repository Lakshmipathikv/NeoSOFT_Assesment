//
//  BaseViewModel.swift
//  NeoSOFT_iOS_Task
//
//  Created by Lakshmipathi MacM1 on 31/08/24.
//

import Foundation

class BaseViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
}

