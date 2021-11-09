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
    let artical: String
    private let totalAmauntI: Int
    var totalAmaunt: String {
        return "\( Currency.currency(price: totalAmauntI)) ₽"
    }
    
    init(model: BuyPrice) {
        img = model.img
        name = model.name
        auther = model.auther
        artical = model.artical
        totalAmauntI = model.amaunt
    }
}
