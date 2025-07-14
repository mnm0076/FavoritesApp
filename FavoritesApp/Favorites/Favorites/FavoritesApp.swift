//
//  FavoritesApp.swift
//  Favorites
//
//  Created by Meghan Murphy on 7/13/25.
//
// "HotPink" is stored as R: 255, G: 98, B: 205
//

import SwiftUI

@main
struct FavoritesApp: App {
    @StateObject private var viewModel = FavoritesViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .tint(Color("HotPink"))
        }
    }
}
