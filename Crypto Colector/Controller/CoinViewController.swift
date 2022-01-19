//
//  ViewController.swift
//  Crypto Colector
//
//  Created by Paweł on 16/01/2022.
//

import UIKit


class CoinViewController: UIViewController {

    @IBOutlet weak var outGuzikPLN: UIButton!
    @IBOutlet weak var outGuzikUSD: UIButton!
    @IBOutlet weak var outGuzikEUR: UIButton!
    

    var priceManager = PriceManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    
    
    @IBAction func pressedRefresh(_ sender: UIButton) {
        // zamień na case
        var fiatName = "PLN"
        
   
        if outGuzikPLN.isSelected {
            fiatName = "PLN"
        } else if outGuzikUSD.isSelected {
            fiatName = "USD"
        } else {
            fiatName = "EUR"
        }
        priceManager.fetchCoinPrice(coinName: "BTC", fiatName: fiatName)
    }

}

