//
//  HomeView.swift
//  CryptoDemo
//
//  Created by Mahipal Kummari on 15/11/2024.
//

import SwiftUI
import UIKit

struct HomeView: View {
    
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
    @State private var selectedCrypto: CryptoModel? = nil
    @State private var showDetailView: Bool = false
    
    
    
    var body: some View {
        VStack {
            
            List {
                ForEach(homeViewModel.allCryptos) { crypto in
                    CryptoRowView(crypto: crypto)
                        .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                        .onTapGesture {
                                segue(crypto:crypto)
                            }
                        .listRowBackground(Color.theme.background)
                }
            }
            .listStyle(PlainListStyle())

        }
        .navigationTitle("Crypto")
        .background(
                NavigationLink(
                    destination: DetailLoadingView(crypto: $selectedCrypto),
                    isActive: $showDetailView,
                    label: { EmptyView() })
        )
    }
    
    private func segue(crypto: CryptoModel) {
        selectedCrypto = crypto
        showDetailView.toggle()
    }

}
  
