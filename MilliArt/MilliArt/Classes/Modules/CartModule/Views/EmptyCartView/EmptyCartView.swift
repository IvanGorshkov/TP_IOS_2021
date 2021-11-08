//
//  EmptyCartView.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 08.11.2021.
//

import UIKit

final class EmptyCartView: UIView {
    internal var title = UILabel()
    internal var subTitle = UILabel()
    internal var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [title, subTitle, imageView].forEach { [weak self] view in
            self?.addSubview(view)
        }
        setUp()
        addViewConstraints()
    }
    
    func setUp() {
        setLabel(label: subTitle, text: TitlesConstants.cartSubTitle, alpha: 0.4, fontSize: 18, weight: .regular)
        setLabel(label: title, text: TitlesConstants.cartTitle, alpha: 0.5, fontSize: 36, weight: .bold)
        setUpImageView()
    }
    
    func setLabel(label: UILabel, text: String, alpha: CGFloat, fontSize: CGFloat, weight: UIFont.Weight) {
        label.text = text
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        label.textColor = ColorConstants.BlackColor.withAlphaComponent(alpha)
    }
    
    func setUpImageView() {
        imageView.image = UIImage(named: "cartImage")
        imageView.contentMode = .scaleAspectFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
