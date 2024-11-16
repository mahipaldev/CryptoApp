//
//  CryptoDetailDataService.swift
//  CryptoDemo
//
//  Created by Mahipal Kummari on 15/11/2024.
//

import Foundation
import Combine

class CryptoDetailDataService {
    
    @Published var cryptoDetails: CryptoDetailModel? = nil
    
    var cryptoDetailSubscription: AnyCancellable?
    let crypto: CryptoModel
    
    init(crypto: CryptoModel) {
        self.crypto = crypto
        getCryptoDetails()
    }
    
    func getCryptoDetails() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(crypto.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else { return }

        cryptoDetailSubscription = NetworkingManager.download(url: url)
            .decode(type: CryptoDetailModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoinDetails) in
                self?.cryptoDetails = returnedCoinDetails
                self?.cryptoDetailSubscription?.cancel()
            })
    }
    
}
