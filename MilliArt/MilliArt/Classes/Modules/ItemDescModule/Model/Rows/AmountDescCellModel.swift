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
    
    var amount: Int
    var rentPreMonth: Int
    var countRent: Int
    
    typealias ActionHandler = () -> ()
    
    var action: ActionHandler?
    
    init(_ model: ItemDescModel, action: ActionHandler?) {
        self.amount = model.amount
        self.rentPreMonth = model.rent
        self.action = action
        self.countRent = model.countRent
    }
}
