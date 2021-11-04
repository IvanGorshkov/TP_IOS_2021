//
//  File.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 04.11.2021.
//

import UIKit

class HorizontalCollectionView: UICollectionViewCell {
    static let cellIdentifier = "HorizontalCollectionView"
    
    var imageView = UIImageView()
    var nameLabel = TopAlignedLabel()
    
    var myWidthAnchor: NSLayoutConstraint!
    
    func configure(model: HorizontalModel) {
        [imageView, nameLabel].forEach { view in
            self.contentView.addSubview(view)
        }
        guard let image = UIImage(named: model.pic) else { return }
        imageView.image = image
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        let nh:CGFloat = 170
        let ow:CGFloat = image.size.width //400x800 -> 200x400
        let oh:CGFloat = image.size.height
        
        let nw = (ow / oh) * nh
        
        nameLabel.text = model.name
       
        nameLabel.textColor = ColorConstants.TextColor
        nameLabel.font = UIFont.systemFont(ofSize:  16, weight: UIFont.Weight.light)
        
        nameLabel.numberOfLines = 0
       
        contentView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        self.imageView.backgroundColor = .red
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        self.imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        self.imageView.heightAnchor.constraint(equalToConstant: 170).isActive = true
     //   self.imageView.widthAnchor.constraint(lessThanOrEqualToConstant: self.frame.size.width).isActive = true
        if myWidthAnchor == nil {
            myWidthAnchor = self.imageView.widthAnchor.constraint(equalToConstant: nw)
            myWidthAnchor.isActive = true
        } else {
            myWidthAnchor.constant = nw
        }
        
//        NSLayoutConstraint.activate([
//               imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//               imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//               imageView.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor),
//               imageView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor),
//               imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1/aspectR)
//               ])
//
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 5).isActive = true
        self.nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        self.nameLabel.heightAnchor.constraint(equalToConstant: 300).isActive = true
        self.nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        contentView.translatesAutoresizingMaskIntoConstraints = false
                
                NSLayoutConstraint.activate([
                    contentView.leftAnchor.constraint(equalTo: leftAnchor),
                    contentView.rightAnchor.constraint(equalTo: rightAnchor),
                    contentView.topAnchor.constraint(equalTo: topAnchor),
                    contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
                ])
        
    }
}
