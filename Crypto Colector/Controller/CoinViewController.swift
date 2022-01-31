//
//  ViewController.swift
//  Crypto Colector
//
//  Created by Paweł on 16/01/2022.
//

import UIKit


class CoinViewController: UIViewController, PriceManagerDelegate {

    @IBOutlet weak var outGuzikPLN: UIButton!
    @IBOutlet weak var outGuzikUSD: UIButton!
    @IBOutlet weak var outGuzikEUR: UIButton!
    
    @IBOutlet weak var outFiatBTC: UILabel!
    @IBOutlet weak var outFiatETH: UILabel!
    @IBOutlet weak var outFiatBNB: UILabel!
    @IBOutlet weak var outFiatADA: UILabel!
    
    var priceManager = PriceManager()
    
    let coinBTC = "BTC"
    let coinETH = "ETH"
    let coinBNB = "BNB"
    let coinADA = "ADA"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        priceManager.delegate = self
    }

    
    
    @IBAction func pressedPlnButton(_ sender: UIButton) {
        outGuzikPLN.isSelected = true
        outGuzikUSD.isSelected = false
        outGuzikEUR.isSelected = false
    }
    @IBAction func pressedUsdButton(_ sender: UIButton) {
        outGuzikPLN.isSelected = false
        outGuzikUSD.isSelected = true
        outGuzikEUR.isSelected = false
    }
    @IBAction func pressedEurButton(_ sender: UIButton) {
        outGuzikPLN.isSelected = false
        outGuzikUSD.isSelected = false
        outGuzikEUR.isSelected = true
    }
    
    @IBAction func pressedRefresh(_ sender: UIButton) {
        var fiatName = "PLN"

   
        if outGuzikPLN.isSelected {
            fiatName = "PLN"
        } else if outGuzikUSD.isSelected {
            fiatName = "USD"
        } else {
            fiatName = "EUR"
        }
        // wysyłka danych do ułożenia URL
        priceManager.fetchCoinPrice(coinName: coinBTC, fiatName: fiatName)
        priceManager.fetchCoinPrice(coinName: coinETH, fiatName: fiatName)
        priceManager.fetchCoinPrice(coinName: coinBNB, fiatName: fiatName)
        priceManager.fetchCoinPrice(coinName: coinADA, fiatName: fiatName)
    }

    // Funkcja aktualizacji ceny:
    func didUpdatePrice(_ priceManager: PriceManager, coin: CoinModel) {
    //    print(ratio)
    //    let ratioString = String(format: "%.2f", ratio)
        
        // główny wątek:
        let cryptoN = coin.coinN
        let ratioString = coin.priceString
    
    
        switch cryptoN {
        case "BTC" : DispatchQueue.main.async {
            self.outFiatBTC.text = ratioString
        }
        case "ETH" : DispatchQueue.main.async {
            self.outFiatETH.text = ratioString
        }
        case "BNB" : DispatchQueue.main.async {
            self.outFiatBNB.text = ratioString
        }
        case "ADA" : DispatchQueue.main.async {
            self.outFiatADA.text = ratioString
        }
        default:
            return
        }
     
    }
  
}

