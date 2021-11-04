//
//  HCollectionViewModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 04.11.2021.
//

import Foundation

final class HCollectionViewModel: BaseCellModel {
    typealias ActionHandler = () -> ()
    var action: ActionHandler?
    
    override var cellIdentifier: String {
        return HorizontalCollectionViewCell.cellIdentifier
    }
    override var cellHeight: Float {
        return 200
    }
    init(action: ActionHandler? = nil) {
        self.action = action
    }
}
