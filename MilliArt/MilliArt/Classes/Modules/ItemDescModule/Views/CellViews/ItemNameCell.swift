//
//  ItemNameCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import UIKit

class ItemNameCell: BaseCell {
    var nameLabel = UILabel()

    static let cellIdentifier = "ItemDescNameCellModel"
    
    override func updateViews() {
        guard let model = model as? ItemDescNameCellModel else {
            return
        }
        nameLabel.text = model.name
    }
    
    
    override func loadSubViews() {
        backgroundColor = .clear
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
        self.addSubview(nameLabel)
        nameLabel.numberOfLines = 0
        nameLabel.textColor = ColorConstants.BlackColor
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.heavy)
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        
    }
}
