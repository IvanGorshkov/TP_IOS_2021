//
//  TotalCellView.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import UIKit

extension TotalCellView {
    func addViewConstraints() {
        VStack.translatesAutoresizingMaskIntoConstraints = false
        VStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        VStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        VStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        VStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        lineView2.translatesAutoresizingMaskIntoConstraints = false
        lineView2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineView2.widthAnchor.constraint(equalToConstant: 250).isActive = true
    }
}
