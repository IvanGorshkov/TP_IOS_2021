//
//  InputSectionModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import Foundation

final class InputSectionModel: SectionRowsRepresentable {
    var rows: [CellIdentifiable]
    
    init(inputs: [InputCheckoutModel], data: (rentArray: [RentPrice], buyArray: [BuyPrice])) {
        rows = [CellIdentifiable]()
        inputs.forEach { [weak self] element in
            self?.rows.append(InputTextFieldModelView(model: element))
        }
        
        rows.append(InputTextViewModelView(placeholder: "Комментарий"))
        rows.append(ItemDescNameCellModel("Способ оплаты"))
        rows.append(RadioButtonViewModel(radioNames: ["Оплата курьеру при получении"]))
        rows.append(TotalCartViewModel(rentArray: data.rentArray, buyArray: data.buyArray))
    }
}
