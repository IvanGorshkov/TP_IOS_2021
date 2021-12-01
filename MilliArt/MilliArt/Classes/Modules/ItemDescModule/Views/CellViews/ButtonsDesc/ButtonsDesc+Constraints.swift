//
//  ButtonsDesc+Constraints.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import UIKit

extension ButtonsDescCell {
    internal func addConstraints() {
        arButton.translatesAutoresizingMaskIntoConstraints = false
        arButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        arButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        arButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        arButton.widthAnchor.constraint(equalToConstant: 50).isActive = true

        favButton.translatesAutoresizingMaskIntoConstraints = false
        favButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        favButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        favButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        favButton.widthAnchor.constraint(equalToConstant: 50).isActive = true

        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        buyButton.leadingAnchor.constraint(equalTo: arButton.trailingAnchor, constant: 10).isActive = true
        buyButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

        rentButton.translatesAutoresizingMaskIntoConstraints = false
        rentButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        rentButton.trailingAnchor.constraint(equalTo: favButton.leadingAnchor, constant: -10).isActive = true
        rentButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

        buyButton.widthAnchor.constraint(equalTo: rentButton.widthAnchor).isActive = true
        rentButton.leadingAnchor.constraint(equalTo: buyButton.trailingAnchor, constant: 10).isActive = true
        
        soldButton.translatesAutoresizingMaskIntoConstraints = false
        soldButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        soldButton.trailingAnchor.constraint(equalTo: favButton.leadingAnchor, constant: -10).isActive = true
        soldButton.leadingAnchor.constraint(equalTo: arButton.trailingAnchor, constant: 10).isActive = true
        soldButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
