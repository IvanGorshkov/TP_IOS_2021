//
//  ItemNameCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import UIKit

final class ItemNameCell: BaseCell {
    internal var nameLabel = UILabel()

    static let cellIdentifier = "ItemDescNameCellModel"
    
    override func updateViews() {
        guard let model = model as? ItemDescNameCellModel else {
            return
        }
        nameLabel.text = model.name
    }
    
    
    override func loadSubViews() {
        setUp()
        addConstraintsName()
    }
    
    private func setUp() {
        setUpBase()
        setUpLabel()
    }
    
    private func setUpBase() {
        backgroundColor = .clear
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
    }
    
    private func setUpLabel() {
        contentView.addSubview(nameLabel)
        nameLabel.numberOfLines = 0
        nameLabel.textColor = ColorConstants.BlackColor
        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.heavy)
    }
}
