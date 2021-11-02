//
//  FrameCell+Constraints.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 01.11.2021.
//

import UIKit

extension FrameCollectionCell {
    internal func addConstraintsCell() {
        noLabel.translatesAutoresizingMaskIntoConstraints = false
        noLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        noLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        noLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        noLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        noLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        noLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        frameView.translatesAutoresizingMaskIntoConstraints = false
        frameMask.translatesAutoresizingMaskIntoConstraints = false
        frameView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        frameView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        frameView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        frameView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        frameMask.widthAnchor.constraint(equalTo: frameView.widthAnchor).isActive = true
        frameMask.heightAnchor.constraint(equalTo: frameView.heightAnchor).isActive = true
        frameMask.leadingAnchor.constraint(equalTo: frameView.leadingAnchor, constant: 10).isActive = true
        frameMask.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -10).isActive = true
    }
}
