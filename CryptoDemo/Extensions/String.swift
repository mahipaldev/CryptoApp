//
//  String.swift
//  CryptoDemo
//
//  Created by Mahipal Kummari on 15/11/2024.
//

import Foundation

extension String {
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
}
