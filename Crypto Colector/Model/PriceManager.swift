//
//  PriceManager.swift
//  Crypto Colector
//
//  Created by Paweł on 18/01/2022.
//

import Foundation

protocol PriceManagerDelegate {
    func didUpdatePrice(_ priceManager: PriceManager, coin: CoinModel)
}

struct PriceManager {
    
    let priceURL = "https://rest.coinapi.io/v1/exchangerate/"
    
    var delegate: PriceManagerDelegate?
    
    
    func fetchCoinPrice (coinName: String, fiatName: String) {
        let urlString = "\(priceURL)\(coinName)/\(fiatName)?apikey=11161ACB-0926-4667-B7B3-82277B4164B6"
        performRequest(urlString: urlString)
      
      //  print(urlString)
    }
    
    func performRequest(urlString: String) {
        // Step 1 tworzę url:
        if let url = URL(string: urlString) {
            // Step 2 tworzę sesję
            let session = URLSession(configuration: .default)
            // Step 3 przypisuję sesję do zadania:
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    //  let dataString = String(data: safeData, encoding: .utf8) tego już nie potrzebuję
                    //  print(dataString) parsuję zamiast drukowania i przypisuję do obiektu
                    if let coinN = parseJSON(priceData: safeData) {
                        self.delegate?.didUpdatePrice(self, coin: coinN)
                      //  print(ratio)
                    }
                }
            }
            
            // let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            // Step 4 start Task
            task.resume()
        }
        
    }
    
  /*
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        
    }
  */
    // zwracam tylko Double
    func parseJSON(priceData: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
           let decodedData = try decoder.decode(CoinData.self, from: priceData)
            // let decodedDataStr = String(format: "%.2f", decodedData)
            
          //  print(decodedData.rate)
            
            let ratio = decodedData.rate
            let coinN = decodedData.asset_id_base
            let coin = CoinModel(coinN: coinN, price: ratio)
          //  print(ratio)
            return coin
        } catch {
            print(error)
            return nil
        }
        
    }
    
}

