//
//  File.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 04.11.2021.
//

import UIKit

class HCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "HorizontalCollectionView"
    
    internal var imageView = UIImageView()
    internal var nameLabel = TopAlignedLabel()
    internal var myWidthAnchor: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [imageView, nameLabel].forEach { [weak self] view in
            self?.contentView.addSubview(view)
        }
        addConstraints()
        setUp()
    }
    
    private func setUp() {
        setUpImageView()
        setUpTitle()
    }
    
    private func setUpImageView() {
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
    }
    
    private func setUpTitle() {
        nameLabel.textColor = ColorConstants.TextColor
        nameLabel.font = UIFont.systemFont(ofSize:  16, weight: UIFont.Weight.light)
        nameLabel.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: HorizontalViewModel) {
        guard let image = UIImage(named: model.pic) else { return }
        imageView.image = image
        nameLabel.text = model.name
        updateWidth(with: image)
    }
}
