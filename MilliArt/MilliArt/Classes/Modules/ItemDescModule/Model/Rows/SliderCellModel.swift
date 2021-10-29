//
//  SliderCellModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import Foundation

class SliderCellModel: BaseCellModel {
    override var cellIdentifier: String {
        return ItemSliderCell.cellIdentifier 
    }
    
    var pics: [String]
    
    init(_ model: ItemDescModel) {
        self.pics = model.pictures
        super.init()
    //    self.height = 200
    }
}
