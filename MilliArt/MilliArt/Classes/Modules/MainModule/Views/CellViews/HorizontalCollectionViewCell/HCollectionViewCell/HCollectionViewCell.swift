//
//  File.swift
//  MilliArt
//
//  Created by Alekhin Sergey on 04.11.2021.
//

import UIKit

final class HCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "HorizontalCollectionView"

    internal var imageView = UIImageView()
    internal var nameLabel = MUILabel()
    internal var myWidthAnchor: NSLayoutConstraint!

    override init(frame: CGRect) {
        super.init(frame: frame)
        [imageView, nameLabel].forEach { [weak self] view in
            self?.contentView.addSubview(view)
        }
        addConstraints()
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.light)
        nameLabel.numberOfLines = 0
        nameLabel.top = true
    }

    func configure(model: CellIdentifiable?) {
        self.imageView.image = nil
        guard let model = model as? HorizontalViewModel else { return }
        nameLabel.text = model.name
        ImageLoader.shared.image(with: model.pic) { image in
            self.imageView.image = image
            guard let image = image else { return }
            self.updateWidth(with: image)
        }
    }
}
