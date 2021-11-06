//
//  FrameViewModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 01.11.2021.
//

import Foundation

final class FrameViewModel: FrameCellProtocol {
    var imageName: String {
        return self.image
    }

    var assertImage: String {
        return "art.scnassets/\(self.image)Color.jpg"
    }
    var isSelected: Bool

    var cellIdentifier: String {
        return FrameCollectionCell.cellIdentifier
    }

    var cellHeight: Float = -1.0

    private var image: String

    init(colorFrame: String, isSelected: Bool) {
        self.image = colorFrame
        self.isSelected = isSelected
    }
}
