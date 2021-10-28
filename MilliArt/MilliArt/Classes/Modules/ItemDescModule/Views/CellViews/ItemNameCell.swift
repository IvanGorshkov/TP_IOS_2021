//
//  ItemNameCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import UIKit

class ItemNameCell: BaseCell {
    var nameLabel: UILabel!

    static let cellIdentifier = "ItemDescNameCellModel"
    
    
    override func updateViews() {
        guard let model = model as? ItemDescNameCellModel else {
            return
        }
        nameLabel.text = model.name
    }
    
    
    override func loadSubViews() {
        nameLabel = UILabel()
        self.addSubview(nameLabel)
        nameLabel.numberOfLines = 0
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.topAnchor.constraint(equalTo: super.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 20).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: super.heightAnchor).isActive = true
        
    }
}
