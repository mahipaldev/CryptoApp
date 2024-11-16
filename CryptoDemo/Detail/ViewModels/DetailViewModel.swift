//
//  DetailViewModel.swift
//  CryptoDemo
//
//  Created by Mahipal Kummari on 15/11/2024.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    @Published var crypto: CryptoModel
    @Published var cryptoDescription: String? = nil
    
    private let cryptoDetailService: CryptoDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(crypto: CryptoModel) {
        self.crypto = crypto
        self.cryptoDetailService = CryptoDetailDataService(crypto: crypto)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        
//        cryptoDetailService.$cryptoDetails
//            .combineLatest($crypto)
//            .sink { [weak self] (returnedArrays) in
//            }
//            .store(in: &cancellables)
//
        cryptoDetailService.$cryptoDetails
            .sink { [weak self] (returnedCryptoDetails) in
                self?.cryptoDescription = returnedCryptoDetails?.readableDescription
            }
            .store(in: &cancellables)
        
    }
    
    
//    private func mapDataToStatistics(coinDetailModel: CryptoDetailModel?, coinModel: CryptoModel) -> (overview: [StatisticModel], additional: [StatisticModel]) {
//        let overviewArray = createOverviewArray(coinModel: coinModel)
//        let additionalArray = createAdditionalArray(coinDetailModel: coinDetailModel, coinModel: coinModel)
//        return (overviewArray, additionalArray)
//    }
//
//    private func createOverviewArray(coinModel: CoinModel) -> [StatisticModel] {
//        let price = coinModel.currentPrice.asCurrencyWith6Decimals()
//        let pricePercentChange = coinModel.priceChangePercentage24H
//        let priceStat = StatisticModel(title: "Current Price", value: price, percentageChange: pricePercentChange)
//
//        let marketCap = "$" + (coinModel.marketCap?.formattedWithAbbreviations() ?? "")
//        let marketCapPercentChange = coinModel.marketCapChangePercentage24H
//        let marketCapStat = StatisticModel(title: "Market Capitalization", value: marketCap, percentageChange: marketCapPercentChange)
//
//        let rank = "\(coinModel.rank)"
//        let rankStat = StatisticModel(title: "Rank", value: rank)
//
//        let volume = "$" + (coinModel.totalVolume?.formattedWithAbbreviations() ?? "")
//        let volumeStat = StatisticModel(title: "Volume", value: volume)
//
//        let overviewArray: [StatisticModel] = [
//            priceStat, marketCapStat, rankStat, volumeStat
//        ]
//        return overviewArray
//    }
//
//    private func createAdditionalArray(coinDetailModel: CoinDetailModel?, coinModel: CoinModel) -> [StatisticModel] {
//        
//        let high = coinModel.high24H?.asCurrencyWith6Decimals() ?? "n/a"
//        let highStat = StatisticModel(title: "24h High", value: high)
//        
//        let low = coinModel.low24H?.asCurrencyWith6Decimals() ?? "n/a"
//        let lowStat = StatisticModel(title: "24h Low", value: low)
//        
//        let priceChange = coinModel.priceChange24H?.asCurrencyWith6Decimals() ?? "n/a"
//        let pricePercentChange = coinModel.priceChangePercentage24H
//        let priceChangeStat = StatisticModel(title: "24h Price Change", value: priceChange, percentageChange: pricePercentChange)
//        
//        let marketCapChange = "$" + (coinModel.marketCapChange24H?.formattedWithAbbreviations() ?? "")
//        let marketCapPercentChange = coinModel.marketCapChangePercentage24H
//        let marketCapChangeStat = StatisticModel(title: "24h Market Cap Change", value: marketCapChange, percentageChange: marketCapPercentChange)
//        
//        let blockTime = coinDetailModel?.blockTimeInMinutes ?? 0
//        let blockTimeString = blockTime == 0 ? "n/a" : "\(blockTime)"
//        let blockStat = StatisticModel(title: "Block Time", value: blockTimeString)
//        
//        let hashing = coinDetailModel?.hashingAlgorithm ?? "n/a"
//        let hashingStat = StatisticModel(title: "Hashing Algorithm", value: hashing)
//        
//        let additionalArray: [StatisticModel] = [
//            highStat, lowStat, priceChangeStat, marketCapChangeStat, blockStat, hashingStat
//        ]
//        return additionalArray
//    }
    
}
