//
//  InputTextFieldModelView.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import Foundation

final class InputTextFieldModelView: BaseCellModel {
    let placeholder: String
    let inputType: InputType
    
    override var cellIdentifier: String {
        return TextFieldCell.cellIdentifier
    }
    
    init(model: InputCheckoutModel) {
        self.placeholder = model.placeholder
        self.inputType = model.inputType
    }
}
