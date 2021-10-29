//
//  ButtonsDescModelCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import Foundation

class ButtonsDescModelCell: BaseCellModel {
    override var cellIdentifier: String {
        return ButtonsDescCell.cellIdentifier
    }
    
    init(_ model: ItemDescModel) {
        super.init()
    }
}
