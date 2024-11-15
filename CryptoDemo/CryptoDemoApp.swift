//
//  CryptoDemoApp.swift
//  CryptoDemo
//
//  Created by Mahipal Kummari on 15/11/2024.
//

import SwiftUI

@main
struct CryptoDemoApp: App {
    
    @StateObject private var homeViewModel = HomeViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().tintColor = UIColor(Color.theme.accent)
        UITableView.appearance().backgroundColor = UIColor.clear
        
        // Set up URLCache
                let memoryCapacity = 20 * 1024 * 1024 // 20 MB
                let diskCapacity = 100 * 1024 * 1024 // 100 MB
                let cache = URLCache(memoryCapacity: memoryCapacity, diskCapacity: diskCapacity, diskPath: "CryptoCache")
                URLCache.shared = cache
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationView {
                    HomeView()
                        .navigationBarHidden(false)
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .environmentObject(homeViewModel)
            }
        }
    }
}
