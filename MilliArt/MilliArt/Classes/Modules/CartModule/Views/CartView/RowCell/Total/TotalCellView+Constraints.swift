//
//  TotalCellView.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import UIKit

extension TotalCellView {
    internal func addViewConstraints() {
        VStack.translatesAutoresizingMaskIntoConstraints = false
        VStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        VStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        VStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        VStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
    }
    
    internal func addLineConstraints(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.widthAnchor.constraint(equalToConstant: 250).isActive = true
    }
}
