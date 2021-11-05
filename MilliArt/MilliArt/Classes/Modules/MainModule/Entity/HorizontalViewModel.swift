//
//  HorizontalViewModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 05.11.2021.
//

import Foundation

class HorizontalViewModel: CellIdentifiable {
    var cellIdentifier: String {
        return HCollectionViewCell.cellIdentifier
    }
    
    var cellHeight: Float {
        return 1
    }
    
    let pic: String
    let name: String
    
    init(pic: String, name: String) {
        self.pic = pic
        self.name = name
    }
}
