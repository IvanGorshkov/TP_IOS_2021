//
//  FrameCollectionCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 01.11.2021.
//

import UIKit

class FrameCollectionCell: BaseCollectionCell {
    static let cellIdentifier = "FrameCollectionCell"
    internal var noLabel = UILabel()
    internal var frameMask = UIView()
    internal var frameView = UIImageView()
    
    override func layoutSubviews() {
        addConstraintsCell()
    }
    override func loadSubViews() {
        [noLabel, frameView, frameMask].forEach ({ [weak self] in self?.contentView.addSubview($0)
        })
        frameMask.backgroundColor = ColorConstants.MainBackGroundColor
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.borderWidth = 1
        noLabel.text = TitlesConstants.noTitle
        noLabel.textAlignment = .center
        noLabel.textColor = ColorConstants.BlackColor
        layoutIfNeeded()
        
    }
    
    override func updateViews() {
        guard let model = model as? FrameViewModel else {
            return
        }
        if model.isSelected {
            contentView.layer.borderColor = ColorConstants.MainPurpleColor.cgColor
        } else {
            contentView.layer.borderColor = UIColor.gray.cgColor
        }
        
        
        if let image = UIImage(named: model.assertImage) {
            noLabel.isHidden = true
            frameMask.isHidden = false
            frameView.isHidden = false
            frameView.image = image
        } else {
            frameMask.isHidden = true
            frameView.isHidden = true
            noLabel.isHidden = false
        }
    }
}
