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
    
    let array: [HorizontalModel]
    
    init(array: [HorizontalModel], action: ActionHandler? = nil) {
        self.action = action
        self.array = array
    }
}
