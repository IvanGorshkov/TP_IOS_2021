//
//  SliderCellModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import Foundation
import ImageSlideshow

final class SliderCellModel: BaseCellModel {
    typealias ActionHandler = (ImageSlideshow) -> Void
    var action: ActionHandler?

    override var cellIdentifier: String {
        return ItemSliderCell.cellIdentifier
    }

    var pics: [String]

    init(_ model: ItemDescModel, action: ActionHandler? = nil) {
        self.pics = model.pictures
        self.action = action
    }
}
