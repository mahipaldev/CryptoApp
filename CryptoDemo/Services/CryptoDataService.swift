//
//  CryptoDataService.swift
//  CryptoDemo
//
//  Created by Mahipal Kummari on 15/11/2024.
//

import Foundation
import Combine

class CryptoDataService {
    
    @Published var allCryptos: [CryptoModel] = []
    
    var cryptoSubscription: AnyCancellable?
    
    init() {
        getCryptos()
    }
    
    func getCryptos() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=aud&order=market_cap_desc&per_page=5&page=1&sparkline=true&price_change_percentage=24h") else { return }

        cryptoSubscription = NetworkingManager.download(url: url)
            .decode(type: [CryptoModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCryptos) in
                self?.allCryptos = returnedCryptos
                self?.cryptoSubscription?.cancel()
            })
    }
    
}
