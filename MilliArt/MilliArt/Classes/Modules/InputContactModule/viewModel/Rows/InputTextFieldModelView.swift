//
//  InputTextFieldModelView.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import Foundation

enum InputType {
    case name
    case tel
    case email
    case address
    case comment
    case payMethod
}

struct InputCheckoutModel {
    let inputType: InputType
    let placeholder: String
}

struct CheckoutDataModel {
    let inputType: InputType
    let text: String
}

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
