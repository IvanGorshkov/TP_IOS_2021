//
//  TotalCartViewModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 08.11.2021.
//

import Foundation

class TotalCartViewModel: BaseCellModel {
    override var cellIdentifier: String {
        return TotalCellView.cellIdentifier
    }
    
    let artCount: String
    let artsAmount: String
    let shipingAmount: String
    let totalAmount: String
    
    init(rentArray: [RentPrice], buyArray: [BuyPrice]) {
        artCount = "\(rentArray.count + buyArray.count) шт."
        
        let totalRentAmount = rentArray.reduce(0) { t, o in
            return t + o.amaunt * o.countRent
        }
        
        let totalBuyAmount = buyArray.reduce(0) { t, o in
            return t + o.amaunt
        }
        artsAmount = "\(Currency.currency(price: totalRentAmount + totalBuyAmount)) ₽"
        
        shipingAmount = "0 ₽"
        totalAmount = "\(Currency.currency(price: totalRentAmount + totalBuyAmount))  ₽"
    }
}
