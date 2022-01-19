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
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        // Step 1 tworzę url:
        if let url = URL(string: urlString) {
            // Step 2 tworzę sesję
            let session = URLSession(configuration: .default)
            // Step 3 przypisuję sesję do zadania:
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            // Step 4 start Task
            task.resume()
        }
        
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
    
}
