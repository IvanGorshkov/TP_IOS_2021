//
//  TextViewCell+Constraints.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import UIKit

extension RadioButtonCell {
    internal func addConstraintsName() {
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        verticalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        verticalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        verticalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
    }
}
