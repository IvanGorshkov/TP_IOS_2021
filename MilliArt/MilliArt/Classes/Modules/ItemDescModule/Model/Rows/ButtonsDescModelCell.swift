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
    
    typealias ActionHandler = () -> ()
    
    var actionAR: ActionHandler?
    var actionBuy: ActionHandler?
    var actionRent: ActionHandler?
    var actionFav: ActionHandler?
    
    init(_ model: ItemDescModel, actionAR: ActionHandler?, actionBuy: ActionHandler?, actionRent: ActionHandler?, actionFav: ActionHandler?) {
        super.init()
        self.actionAR = actionAR
        self.actionRent = actionRent
        self.actionFav = actionFav
        self.actionBuy = actionBuy
    }
}
