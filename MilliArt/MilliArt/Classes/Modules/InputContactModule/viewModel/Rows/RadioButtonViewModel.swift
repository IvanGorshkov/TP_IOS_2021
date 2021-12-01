//
//  RadioButtonViewModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 12.11.2021.
//

import Foundation

final class RadioButtonViewModel: BaseCellModel {
    override var cellIdentifier: String {
        return RadioButtonCell.cellIdentifier
    }
    
    let radioNames: [String]
    
    init(radioNames: [String]) {
        self.radioNames = radioNames
    }
}
