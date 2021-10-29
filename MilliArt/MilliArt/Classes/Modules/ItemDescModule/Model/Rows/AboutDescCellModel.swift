//
//  AboutDescCellModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import Foundation

final class AboutDescCellModel: BaseCellModel {
    override var cellIdentifier: String {
        return AboutDescCell.cellIdentifier
    }
    
    let text: String
    init(_ model: ItemDescModel) {
        text = model.description
        super.init()
    }
}
