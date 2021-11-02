//
//  FrameViewModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 01.11.2021.
//

import Foundation

final class FrameViewModel: FrameCellProtocol {
    var isSelected: Bool
    
    var cellIdentifier: String {
        return FrameCollectionCell.cellIdentifier
    }
    
    var cellHeight: Float = -1.0
    var colorFrame: String
    init(colorFrame: String, isSelected: Bool) {
        self.colorFrame = colorFrame
        self.isSelected = isSelected
    }
}
