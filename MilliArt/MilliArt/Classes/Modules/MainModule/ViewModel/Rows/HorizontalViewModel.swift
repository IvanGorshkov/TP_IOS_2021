//
//  HorizontalViewModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 05.11.2021.
//

import UIKit

class HorizontalViewModel: CellIdentifiable {
    var cellIdentifier: String {
        return HCollectionViewCell.cellIdentifier
    }

    var cellHeight: Float {
        return 1
    }

    let pic: String
    let name: String

    let height: CGFloat
    let width: CGFloat
    
    var widthConstrint: CGFloat {
        let nHeight = CGFloat(170)
        let nWidth = (width / height) * nHeight
        return nWidth
    }
    
    init(pic: String, name: String, height: Int, width: Int) {
        self.pic = pic
        self.name = name
        self.height = CGFloat(height)
        self.width = CGFloat(width)
    }
}
