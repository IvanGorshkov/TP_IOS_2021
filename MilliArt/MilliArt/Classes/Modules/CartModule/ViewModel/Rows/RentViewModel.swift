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
    
    let id: Int
    let img: String
    let name: String
    let auther: String
    let artical: String
    var amaunt: String {
        return "\( Currency.currency(price: amauntI)) ₽"
    }
    var countRent: String {
        return "\( countRentI )"
    }
    var totalAmaunt: String {
        return "\( Currency.currency(price: countRentI * amauntI)) ₽"
    }
    
    private let countRentI: Int
    private let amauntI: Int
    
    typealias ActionHandler = (Int) -> Void
    var delete: ActionHandler?
    
    init(model: RentPrice, delete: ActionHandler?) {
        id = model.id
        img = model.img
        name = model.name
        auther = model.auther
        artical = model.artical
        amauntI = model.amaunt
        countRentI = model.countRent
        self.delete = delete
    }
}
