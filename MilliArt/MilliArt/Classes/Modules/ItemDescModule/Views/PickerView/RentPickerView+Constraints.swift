//
//  RentPickerView+Constraints.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import UIKit

extension RentPickerView {
    internal func addConstraintRentPickerView() {
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        self.button.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.picker.translatesAutoresizingMaskIntoConstraints = false
        self.picker.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.picker.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.picker.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.picker.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
