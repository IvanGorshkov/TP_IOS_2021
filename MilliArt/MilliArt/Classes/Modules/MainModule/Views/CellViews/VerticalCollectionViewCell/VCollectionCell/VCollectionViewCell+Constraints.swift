//
//  HeaderCell+Constraints.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 04.11.2021.
//

import UIKit

extension VCollectionViewCell {
    internal func addConstraints() {
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        self.imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true

        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 5).isActive = true
        self.nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        self.priceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.priceLabel.topAnchor.constraint(equalTo: self.imageView.topAnchor).isActive = true
        self.priceLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true

        self.sizeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.sizeLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 5).isActive = true
        self.sizeLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        self.sizeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        self.sizeLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true

        self.nameLabel.trailingAnchor.constraint(equalTo: self.sizeLabel.leadingAnchor).isActive = true
    }

    internal func updateHeight(with layoutAttributes: MosaicLayoutAttributes) {
        if myHeightAnchor == nil {
            myHeightAnchor = imageView.heightAnchor.constraint(equalToConstant: layoutAttributes.imageHeight)
            myHeightAnchor.isActive = true
        } else {
            myHeightAnchor.constant = layoutAttributes.imageHeight
        }
    }
}
