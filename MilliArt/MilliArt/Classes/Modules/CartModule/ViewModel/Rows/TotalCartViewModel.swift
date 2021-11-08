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
    
    let artCountLabel: String
    let artsAmountLabel: String
    let shipingAmountLabel: String
    let totalAmountLabel: String
    
    init(rentArray: [RentPrice], buyArray: [BuyPrice]) {
        artCountLabel = "\(rentArray.count + buyArray.count) шт"
        
        let tot1 = rentArray.reduce(0) { t, o in
            return t + o.amaunt * o.countRent
        }
        
        let tot2 = buyArray.reduce(0) { t, o in
            return t + o.amaunt
        }
        artsAmountLabel = "\(tot1 + tot2) ₽"
        
        shipingAmountLabel = "0 ₽"
        totalAmountLabel = "\(tot1 + tot2)  ₽"
    }
}
