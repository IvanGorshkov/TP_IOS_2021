//
//  BaseCollectionCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 01.11.2021.
//

import UIKit

class BaseCollectionCell: UICollectionViewCell, ModelRepresentable {
    var model: CellIdentifiable? {
        didSet {
            loadSubViews()
            updateViews()
        }
    }

    func updateViews() { fatalError("Abstract class, dont use") }
    
    func loadSubViews() { fatalError("Abstract class, dont use") }
    
}
