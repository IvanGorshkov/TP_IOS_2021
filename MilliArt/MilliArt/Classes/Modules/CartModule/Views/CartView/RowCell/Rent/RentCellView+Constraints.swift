//
//  RentCellView.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import UIKit

extension RentCellView {
    func addViewConstraints() {
        HStackIn.translatesAutoresizingMaskIntoConstraints = false
        HStackIn.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        HStackIn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        HStackIn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        HStackIn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        
        imagePainting.translatesAutoresizingMaskIntoConstraints = false
        imagePainting.widthAnchor.constraint(equalToConstant: 75).isActive = true
        imagePainting.heightAnchor.constraint(equalTo: imagePainting.widthAnchor).isActive = true
        
        trash.translatesAutoresizingMaskIntoConstraints = false
        trash.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        trash.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
}
