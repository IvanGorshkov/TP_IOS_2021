//
//  RentViewModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import Foundation

class RentViewModel: BaseCellModel {
    override var cellIdentifier: String {
        return RentCellView.cellIdentifier
    }
    
    let img: String
    let name: String
    let auther: String
    let artical: String
    let cost: String
    var amaunt: String {
        return "\( Currency.currency(price: amauntI)) ₽"
    }
    let rent: String
    var countRent: String {
        return "\( countRentI )"
    }
    
    let total: String
    var totalAmaunt: String {
        return "\( Currency.currency(price: countRentI * amauntI)) ₽"
    }
    
    let countRentI: Int
    let amauntI: Int
    var articalTitle: String {
        return "Артикул: \(artical)"
    }
    
    init(model: RentPrice) {
        img = model.img
        name = model.name
        auther = model.auther
        artical = model.artical
        cost = "Стоимость"
        amauntI = model.amaunt
        rent = "Срок"
        countRentI = model.countRent
        total = "Сумма"
    }
}
