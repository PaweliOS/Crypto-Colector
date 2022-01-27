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
    
    var priceManager = PriceManager()
    
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
        priceManager.fetchCoinPrice(coinName: "BTC", fiatName: fiatName)
      //  priceManager.fetchCoinPrice(coinName: "ETH", fiatName: fiatName)
    }

    // Funkcja aktualizacji ceny:
    func didUpdatePrice(ratio: Double) {
        print(ratio)
        let ratioString = String(format: "%.2f", ratio)
        // główny wątek:
        DispatchQueue.main.async {
            self.outFiatBTC.text = ratioString
        }
        
    }
    
}

