//
//  CryptoRowView.swift
//  CryptoDemo
//
//  Created by Mahipal Kummari on 15/11/2024.
//

import SwiftUI
import UIKit

struct CryptoRowView: View {
    let crypto: CryptoModel
    
    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            Spacer()
            rightColumn
        }
        .font(.subheadline)
        .background(Color.theme.background)
    }
}

struct CryptoRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CryptoRowView(crypto:dev.crypto)
                .previewLayout(.sizeThatFits)

            CryptoRowView(crypto: dev.crypto)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}

@MainActor
extension CryptoRowView {
    
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(crypto.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.accent)
                .frame(minWidth: 30)
            //Image
            CryptoImageView(crypto:crypto)
                .frame(width: 32, height: 32)
                .scaledToFit()
            
            Text(crypto.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.accent)
        }
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(crypto.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundColor(Color.theme.background)
            Text(crypto.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundColor(
                    (crypto.priceChangePercentage24H ?? 0 >= 0) ?
                    Color.green :
                    Color.red
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
