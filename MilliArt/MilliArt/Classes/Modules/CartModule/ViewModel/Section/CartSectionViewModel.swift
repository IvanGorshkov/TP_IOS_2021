//
//  CartSectionViewModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 08.11.2021.
//

import Foundation

final class CartSectionViewModel: BaseCellModel, SectionRowsRepresentable {
    override var cellIdentifier: String {
        return SectionViewCell.cellIdentifier
    }
    
    var rows: [CellIdentifiable]
    var title: String
    var isExpandable: Bool
    init(rows: [CellIdentifiable], title: String) {
        self.rows = rows
        self.title = title
        isExpandable = true
    }
    
    init(rows: [CellIdentifiable]) {
        self.rows = rows
        self.title = "title"
        isExpandable = false
    }
}

final class ConstructorCartSectionViewModel {
    var modelArray = [CartSectionViewModel]()
    
    init(rentArray: [RentPrice], buyArray: [BuyPrice], actionRent: ((Int) -> Void)?, actionBuy: ((Int) -> Void)?) {
        if !rentArray.isEmpty {
            modelArray.append(CartSectionViewModel(rows: rentArray.map({ rent in
                return RentViewModel(model: rent, delete: actionRent)
            }), title: "Аренда"))
        }
        if !buyArray.isEmpty {
            modelArray.append(CartSectionViewModel(rows: buyArray.map({ buy in
                return BuyViewModel(model: buy, delete: actionBuy)
            }), title: "Покупка"))
        }
        if !buyArray.isEmpty || !rentArray.isEmpty {
            modelArray.append(CartSectionViewModel(rows: [TotalCartViewModel(rentArray: rentArray, buyArray: buyArray)]))
        }
    }
}
