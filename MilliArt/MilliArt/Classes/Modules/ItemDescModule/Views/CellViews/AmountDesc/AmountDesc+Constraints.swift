//
//  AmountDesc+Constraints.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import UIKit

extension AmountDescCell {
    internal func addConstraints() {
        HStackIn.translatesAutoresizingMaskIntoConstraints = false
        HStackIn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        HStackIn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        HStackIn.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        
        rentLabel.translatesAutoresizingMaskIntoConstraints = false
        rentLabel.topAnchor.constraint(equalTo: HStackIn.bottomAnchor, constant: 10).isActive = true
        rentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        rentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
    }
}
