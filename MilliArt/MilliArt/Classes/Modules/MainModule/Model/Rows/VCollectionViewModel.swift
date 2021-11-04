//
//  HCollectionViewModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 04.11.2021.
//

import Foundation

final class VCollectionViewModel: BaseCellModel {
    typealias ActionHandler = () -> ()
    var action: ActionHandler?
    
    override var cellIdentifier: String {
        return VerticalCollectionViewCell.cellIdentifier
    }
    
    init(action: ActionHandler? = nil) {
        self.action = action
    }
}
