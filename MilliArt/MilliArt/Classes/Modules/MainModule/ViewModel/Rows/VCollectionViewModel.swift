//
//  HCollectionViewModel.swift
//  MilliArt
//
//  Created by Alekhin Sergey on 04.11.2021.
//

import Foundation

final class VCollectionViewModel: BaseCellModel {
    typealias ActionHandler = (Int) -> Void
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
