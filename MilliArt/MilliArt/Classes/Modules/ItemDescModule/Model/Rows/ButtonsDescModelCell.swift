//
//  ButtonsDescModelCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import Foundation

final class ButtonsDescModelCell: BaseCellModel {
    override var cellIdentifier: String {
        return ButtonsDescCell.cellIdentifier
    }

    typealias ActionHandler = () -> Void
    typealias ActionSelectedHandler = (Bool) -> Void

    var actionAR: ActionHandler?
    var actionBuy: ActionSelectedHandler?
    var actionRent: ActionSelectedHandler?
    var actionFav: ActionHandler?
    var selected: Bool
    var isRent: Bool
    
    init(_ model: ItemDescModel, actionAR: ActionHandler?, actionBuy: ActionSelectedHandler?, actionRent: ActionSelectedHandler?, actionFav: ActionHandler?, inCart: (isSelected: Bool, isRent: Bool)) {
        self.actionAR = actionAR
        self.actionRent = actionRent
        self.actionFav = actionFav
        self.actionBuy = actionBuy
        self.selected = inCart.isSelected
        self.isRent = inCart.isRent
    }
}
