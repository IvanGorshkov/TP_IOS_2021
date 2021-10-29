//
//  SpecificationsDescCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import UIKit

class SpecificationsDescCell: BaseCell {
    var titleLabel = UILabel()
    var specification = UILabel()

    static let cellIdentifier = "SpecificationsDescCell"
    
    
    override func updateViews() {
        guard let model = model as? SpecificationsDescCellModel else {
            return
        }
        titleLabel.text = model.title
        specification.text = model.specification
    }
    
    
    override func loadSubViews() {
        self.addSubview(titleLabel)
        self.addSubview(specification)
        
        separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        backgroundColor = .clear
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = ColorConstants.BlackColor
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 20).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 55).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
        specification.numberOfLines = 0
        specification.translatesAutoresizingMaskIntoConstraints = false
        specification.textColor = ColorConstants.BlackColor
        
        specification.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        specification.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 20).isActive = true
        specification.heightAnchor.constraint(equalToConstant: 55).isActive = true
        specification.trailingAnchor.constraint(equalTo: super.trailingAnchor, constant: -10).isActive = true
        
    }
}
