//
//  File.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 04.11.2021.
//

import UIKit

class VerticalCollectionCell: UICollectionViewCell {
    var myHeightAnchor: NSLayoutConstraint!

    static let cellIdentifier = "VerticalCollectionCell"
    
    var imageView = UIImageView()
    var priceLabel = UILabel()
    var nameLabel = UILabel()
    func configure(model: PainingMini) {
        [imageView, priceLabel, nameLabel].forEach { view in
            self.contentView.addSubview(view)
        }
        imageView.image = UIImage(named: model.pic)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        priceLabel.text = model.price
        nameLabel.text = model.name
        nameLabel.numberOfLines = 0
        contentView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        
        
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        self.imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        
        
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 1).isActive = true
        self.nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        self.nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
      super.apply(layoutAttributes)
      let attributes = layoutAttributes as! MosaicLayoutAttributes
        print(attributes.imageHeight)
        if myHeightAnchor == nil {
            myHeightAnchor = imageView.heightAnchor.constraint(equalToConstant: attributes.imageHeight)
            myHeightAnchor.isActive = true
        } else {
            myHeightAnchor.constant = attributes.imageHeight
        }
//        updateConstraints()
    }
    
}
