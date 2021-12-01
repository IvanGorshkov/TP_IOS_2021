//
//  InputTextFieldModelView.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import Foundation

final class InputTextViewModelView: BaseCellModel {
    override var cellIdentifier: String {
        return TextViewCell.cellIdentifier
    }
    
    let placeholder: String
    
    init(placeholder: String) {
        self.placeholder = placeholder
    }
}
