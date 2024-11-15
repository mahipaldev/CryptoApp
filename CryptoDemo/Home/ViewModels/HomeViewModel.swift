//
//  HomeViewModel.swift
//  CryptoDemo
//
//  Created by Mahipal Kummari on 15/11/2024.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCryptos: [CryptoModel] = []
        
    private let cryptoDataService = CryptoDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        
        // updates allCryptos
        cryptoDataService.$allCryptos
            .sink { [weak self] (returnedCryptos) in
                self?.allCryptos = returnedCryptos
            }
            .store(in: &cancellables)
    }
    
}
