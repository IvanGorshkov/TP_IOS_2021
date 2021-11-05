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
        return VCollectionViewTableViewCell.cellIdentifier
    }
    let array: [VerticalPaintsModel]
    
    init(action: ActionHandler? = nil, newPaints: [VerticalPaintsModel]) {
        self.action = action
        self.array = newPaints
    }
}
