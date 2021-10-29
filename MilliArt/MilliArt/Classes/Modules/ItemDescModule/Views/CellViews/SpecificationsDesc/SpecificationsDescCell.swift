//
//  SpecificationsDescCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import UIKit

final class SpecificationsDescCell: BaseCell {
    internal var titleLabel = UILabel()
    internal var specification = UILabel()

    static let cellIdentifier = "SpecificationsDescCell"
    
    override func updateViews() {
        guard let model = model as? SpecificationsDescCellModel else {
            return
        }
        titleLabel.text = model.title
        specification.text = model.specification
    }
    
    
    override func loadSubViews() {
        setUp()
        addConstraintsSpecifications()
     }
    
    private func setUp() {
        setUpBase()
        setUpLabels()
    }
    
    private func setUpBase() {
        backgroundColor = .clear
        separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    private func setUpLabels() {
        [titleLabel, specification].forEach( {
            contentView.addSubview($0)
            $0.numberOfLines = 0
            $0.textColor = ColorConstants.BlackColor
        })
    }
}
