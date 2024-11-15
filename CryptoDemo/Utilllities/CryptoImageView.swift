//
//  CryptoImageView.swift
//  CryptoDemo
//
//  Created by Mahipal Kummari on 15/11/2024.
//

import SwiftUI

import SwiftUI

struct CryptoImageView: View {
    
    @StateObject var vm: CryptoImageViewModel
    
    init(crypto: CryptoModel) {
        _vm = StateObject(wrappedValue: CryptoImageViewModel(crypto: crypto))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}

struct CryptoImageView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoImageView(crypto: dev.crypto)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

