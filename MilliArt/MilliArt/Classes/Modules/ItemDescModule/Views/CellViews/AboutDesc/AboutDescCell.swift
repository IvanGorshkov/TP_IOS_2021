//
//  AboutDescCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import UIKit

final class AboutDescCell: BaseCell {
    internal var descriptionLabel = UILabel()
    private var stringValue: String? {
        didSet {
            descriptionLabel.attributedText = stringValue?.textWithLineSpace()
        }
    }
    static let cellIdentifier = "AboutDescCellModel"
    
    
    override func updateViews() {
        guard let model = model as? AboutDescCellModel else { return }
        stringValue = "\(TitlesConstants.AboutTitle)\n\(model.text)"
    }
    
    
    override func loadSubViews() {
        setUp()
        addConstraintsDescription()
     }
    
    private func setUp() {
        setUpBase()
        setUpDescription()
    }
    
    private func setUpBase() {
        backgroundColor = .clear
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
    }
    
    private func setUpDescription() {
        contentView.addSubview(descriptionLabel)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.thin)
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.textColor = ColorConstants.BlackColor
    }
}
