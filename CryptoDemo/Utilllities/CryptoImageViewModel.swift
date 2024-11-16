//
//  CryptoImageViewModell.swift
//  CryptoDemo
//
//  Created by Mahipal Kummari on 15/11/2024.
//

import Foundation
import SwiftUI
import Combine

class CryptoImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let crypto: CryptoModel
    private let dataService: CryptoImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(crypto: CryptoModel) {
        self.crypto = crypto
        self.dataService = CryptoImageService(crypto: crypto)
        self.addSubscribers()
        self.isLoading = true
    }
    
    private func addSubscribers() {
        dataService.$image
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
        
    }
    
}
