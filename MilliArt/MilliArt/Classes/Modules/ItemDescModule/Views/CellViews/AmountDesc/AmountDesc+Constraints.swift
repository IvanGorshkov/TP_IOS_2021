//
//  AmountDesc+Constraints.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import UIKit

extension AmountDescCell {
    internal func addConstraints() {
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true

        monthCountLabel.translatesAutoresizingMaskIntoConstraints = false
        monthCountLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        monthCountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true

        amountLabel.centerYAnchor.constraint(equalTo: monthCountLabel.centerYAnchor).isActive = true

        rentLabel.translatesAutoresizingMaskIntoConstraints = false
        rentLabel.topAnchor.constraint(equalTo: monthCountLabel.bottomAnchor, constant: 10).isActive = true
        rentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        rentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
    }
}
