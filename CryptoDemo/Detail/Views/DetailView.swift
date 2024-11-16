//
//  DetailView.swift
//  CryptoDemo
//
//  Created by Mahipal Kummari on 15/11/2024.
//

import SwiftUI

struct DetailLoadingView: View {
    
    @Binding var crypto: CryptoModel?

    var body: some View {
        ZStack {
            if let crypto = crypto {
                DetailView(crypto: crypto)
            }
        }
    }
    
}

struct DetailView: View {
    
    @StateObject private var vm: DetailViewModel
    @State private var showFullDescription: Bool = false
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    private let spacing: CGFloat = 30
    
    init(crypto: CryptoModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(crypto: crypto))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ChartView(crypto: vm.crypto)
                    .padding(.vertical)

                VStack(spacing: 20) {
                    overviewTitle
                    Divider()
                    descriptionSection
                
                }
                .padding()
            }
        }
        .background(
            Color.theme.background
                .ignoresSafeArea()
        )
        .navigationTitle(vm.crypto.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                navigationBarTrailingItems
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(crypto: dev.crypto)
        }
    }
}

extension DetailView {
    
    private var navigationBarTrailingItems: some View {
        HStack {
            Text(vm.crypto.symbol.uppercased())
                .font(.headline)
                .foregroundColor(Color.theme.secondaryText)
            CryptoImageView(crypto: vm.crypto)
                .frame(width: 25, height: 25)
        }
    }
    
    private var overviewTitle: some View {
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var descriptionSection: some View {
        ZStack {
            if let cryptoDescription = vm.cryptoDescription,
               !cryptoDescription.isEmpty {
                VStack(alignment: .leading) {
                    Text(cryptoDescription)
                        .lineLimit(showFullDescription ? nil : 3)
                        .font(.callout)
                        .foregroundColor(Color.theme.secondaryText)

                    Button(action: {
                        withAnimation(.easeInOut) {
                            showFullDescription.toggle()
                        }
                    }, label: {
                        Text(showFullDescription ? "Less" : "Read more..")
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(.vertical, 4)
                    })
                    .accentColor(.blue)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
    
}

