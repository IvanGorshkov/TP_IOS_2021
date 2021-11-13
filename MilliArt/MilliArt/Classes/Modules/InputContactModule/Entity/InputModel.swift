//
//  InputModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 13.11.2021.
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
