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
    override func loadSubViews() {
        contentView.addSubview(noLabel)
        contentView.addSubview(frameView)
        contentView.addSubview(frameMask)
        frameMask.backgroundColor = ColorConstants.MainBackGroundColor
        frameView.backgroundColor = .red
        noLabel.translatesAutoresizingMaskIntoConstraints = false
        noLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        noLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        noLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        noLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        noLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        noLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        frameView.translatesAutoresizingMaskIntoConstraints = false
        frameMask.translatesAutoresizingMaskIntoConstraints = false
        frameView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        frameView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        frameView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        frameView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        frameMask.widthAnchor.constraint(equalTo: frameView.widthAnchor).isActive = true
        frameMask.heightAnchor.constraint(equalTo: frameView.heightAnchor).isActive = true
        frameMask.leadingAnchor.constraint(equalTo: frameView.leadingAnchor, constant: 10).isActive = true
        frameMask.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -10).isActive = true
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.borderWidth = 1
        
    }
    
    override func updateViews() {
        guard let model = model as? FrameViewModel else {
            return
        }
        if model.colorFrame != "" { noLabel.isHidden = true }
        noLabel.text = "Нет"
        noLabel.textAlignment = .center
        noLabel.textColor = ColorConstants.BlackColor
        print("isSelected \(isSelected)")
        if isSelected == true || model.isSelected {
            contentView.layer.borderColor = ColorConstants.MainPurpleColor.cgColor
        } else {
            contentView.layer.borderColor = UIColor.gray.cgColor
        }
        
        
        if model.colorFrame != "" {
            noLabel.isHidden = true
            frameMask.isHidden = false
            frameView.isHidden = false
            frameView.image = UIImage(named: "art.scnassets/\(model.colorFrame)Color.jpg")
        } else {
            frameMask.isHidden = true
            frameView.isHidden = true
            noLabel.isHidden = false
        }
    }
}
