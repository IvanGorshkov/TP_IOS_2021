//
//  ItemDescNameCellModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import Foundation

final class ItemDescNameCellModel: BaseCellModel {
    override var cellIdentifier: String {
        return ItemNameCell.cellIdentifier
    }
    
    var name: String
    
    init(_ model: ItemDescModel) {
        self.name = model.name
    }
}
