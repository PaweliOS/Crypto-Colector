//
//  CoinModel.swift
//  Crypto Colector
//
//  Created by Paweł on 27/01/2022.
//

import Foundation

struct CoinModel {
    let coinN: String
    let price: Double
    
    var priceString: String {
        
        return String(format: "%.1f", price)
    }
}
