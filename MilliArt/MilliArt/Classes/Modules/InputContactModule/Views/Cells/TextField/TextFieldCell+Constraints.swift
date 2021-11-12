//
//  TextFieldCell+Constraints.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import UIKit

extension TextFieldCell {
    internal func addConstraintsName() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        line.translatesAutoresizingMaskIntoConstraints = false
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, constant: -40).isActive = true
        line.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 1).isActive = true
        line.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        
        labelError.translatesAutoresizingMaskIntoConstraints = false
        labelError.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, constant: -40).isActive = true
        labelError.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        labelError.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 5).isActive = true
        myHeightAnchor = labelError.heightAnchor.constraint(equalToConstant: 0)
        myHeightAnchor.isActive = true
        labelError.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
}
