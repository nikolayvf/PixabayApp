//
//  PixabayAppApp.swift
//  PixabayApp
//
//  Created by Nikolay Filipov
//

import SwiftUI

@main
struct PixabayAppApp: App {
    @StateObject private var viewModel = MainViewModel()

    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: viewModel)
        }
    }
}
