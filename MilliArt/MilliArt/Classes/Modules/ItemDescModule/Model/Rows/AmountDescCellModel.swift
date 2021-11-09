//
//  AmountDescCellModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 30.10.2021.
//

import Foundation

final class AmountDescCellModel: BaseCellModel {
    override var cellIdentifier: String {
        return AmountDescCell.cellIdentifier
    }

    var amount: String
    var rentPreMonth: Int
    var countRent: Int
    var totalRentAmount: String {
        return Currency.currency(price: rentPreMonth * countRent)
    }

    typealias ActionHandler = () -> Void

    var action: ActionHandler?

    init(_ model: ItemDescModel, action: ActionHandler?) {
        self.amount = Currency.currency(price: model.amount)
        self.rentPreMonth = model.rent
        self.action = action
        self.countRent = model.countRent
    }
}
