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
    var priceLabel = PaddingLabel()
    var nameLabel = TopAlignedLabel()
    var sizeLabel = TopAlignedLabel()
    
    func configure(model: PainingMini) {
        [imageView, priceLabel, nameLabel, sizeLabel].forEach { view in
            self.contentView.addSubview(view)
        }
        imageView.image = UIImage(named: model.pic)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        priceLabel.text = model.price
        nameLabel.text = model.name
        sizeLabel.text = model.size
        sizeLabel.textAlignment = .right
        nameLabel.textColor = ColorConstants.TextColor
        sizeLabel.textColor = ColorConstants.TextColor
        nameLabel.font = UIFont.systemFont(ofSize:  16, weight: UIFont.Weight.light)
        sizeLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)
        priceLabel.textColor = .white
        nameLabel.numberOfLines = 3
        sizeLabel.numberOfLines = 1
        contentView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        priceLabel.layer.cornerRadius = 10
        priceLabel.clipsToBounds = true
        priceLabel.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner]
        priceLabel.backgroundColor = ColorConstants.MainPurpleColor
        
        
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        self.imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        
        
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 5).isActive = true
        self.nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        self.priceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.priceLabel.topAnchor.constraint(equalTo: self.imageView.topAnchor).isActive = true
        self.priceLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        self.priceLabel.padding(5, 5, 5, 5)
        self.sizeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.sizeLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 5).isActive = true
        self.sizeLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        self.sizeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        self.sizeLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        self.nameLabel.trailingAnchor.constraint(equalTo: self.sizeLabel.leadingAnchor).isActive = true
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
      super.apply(layoutAttributes)
      let attributes = layoutAttributes as! MosaicLayoutAttributes
        if myHeightAnchor == nil {
            myHeightAnchor = imageView.heightAnchor.constraint(equalToConstant: attributes.imageHeight)
            myHeightAnchor.isActive = true
        } else {
            myHeightAnchor.constant = attributes.imageHeight
        }
    }
    
}

class PaddingLabel: UILabel {
    
    var insets = UIEdgeInsets.zero
    
    /// Добавляет отступы
    func padding(_ top: CGFloat, _ bottom: CGFloat, _ left: CGFloat, _ right: CGFloat) {
        self.frame = CGRect(x: 0, y: 0, width: self.frame.width + left + right, height: self.frame.height + top + bottom)
        insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += insets.top + insets.bottom
            contentSize.width += insets.left + insets.right
            return contentSize
        }
    }
}

class TopAlignedLabel: UILabel {
      override func drawText(in rect: CGRect) {
        let textRect = super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
        super.drawText(in: textRect)
      }
}
