//
//  BuyViewModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import Foundation

class BuyViewModel: BaseCellModel {
    override var cellIdentifier: String {
        return BuyCellView.cellIdentifier
    }
    
    let img: String
    let name: String
    let auther: String
    var artical: String
    
    let total: String
    var totalAmaunt: String {
        return "\( Currency.currency(price: totalAmauntI)) ₽"
    }
    
    let totalAmauntI: Int
    var articalTitle: String {
        return "Артикул: \(artical)"
    }
    init(model: BuyPrice) {
        img = model.img
        name = model.name
        auther = model.auther
        artical = model.artical
        totalAmauntI = model.amaunt
        total = "Сумма"
    }
}
