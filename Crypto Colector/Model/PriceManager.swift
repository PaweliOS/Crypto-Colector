//
//  PriceManager.swift
//  Crypto Colector
//
//  Created by Paweł on 18/01/2022.
//

import Foundation

struct PriceManager {
    
    let priceURL = "https://rest.coinapi.io/v1/exchangerate/"
    
    func fetchCoinPrice (coinName: String, fiatName: String) {
        let urlString = "\(priceURL)\(coinName)/\(fiatName)?apikey=11161ACB-0926-4667-B7B3-82277B4164B6"
        print(urlString)
    }
    

    
}
