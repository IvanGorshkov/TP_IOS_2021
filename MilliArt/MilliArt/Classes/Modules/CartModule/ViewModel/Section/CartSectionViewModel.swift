//
//  CartSectionViewModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 08.11.2021.
//

import Foundation

class CartSectionViewModel: BaseCellModel, SectionRowsRepresentable {
    override var cellIdentifier: String {
        return SectionViewCell.cellIdentifier
    }
    
    var rows: [CellIdentifiable]
    var title: String
    var open: Bool
    init(rows: [CellIdentifiable], title: String) {
        self.rows = rows
        self.title = title
        open = true
    }
    
    init(rows: [CellIdentifiable]) {
        self.rows = rows
        self.title = "title"
        open = false
    }
}
