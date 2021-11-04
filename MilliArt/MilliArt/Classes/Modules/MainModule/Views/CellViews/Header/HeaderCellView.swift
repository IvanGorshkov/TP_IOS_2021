//
//  HeaderCellView.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 04.11.2021.
//

import UIKit

final class HeaderCellView: BaseCell {
    internal var titleLabel = UILabel()
    internal var allButton = UIButton()

    static let cellIdentifier = "HeaderCellModel"
    
    override func updateViews() {
        guard let model = model as? HeaderCellModel else {
            return
        }
        titleLabel.text = model.title
        
        if model.action == nil {
            allButton.isHidden = true
        } else {
            allButton.setTitle(TitlesConstants.all, for: .normal)
        }
    }
    
    
    override func loadSubViews() {
        setUp()
        addConstraintsHeader()
    }
    
    private func setUp() {
        setUpBase()
        setUpLabel()
        contentView.addSubview(allButton)
        allButton.addTarget(self, action:  #selector(clickAll), for: .touchUpInside)
        allButton.setTitleColor(ColorConstants.BlackColor, for: .normal)
    }
    
    @objc
    private func clickAll() {
    }
    
    private func setUpBase() {
        backgroundColor = .clear
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
    }
    
    private func setUpLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.numberOfLines = 0
        titleLabel.textColor = ColorConstants.BlackColor
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.heavy)
    }
}
