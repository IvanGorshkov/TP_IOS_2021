//
//  RentCellView.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import UIKit

class BuyCellView: BaseCartCell {
    internal var nameLabel = UILabel()
    internal var autherLabel = UILabel()
    internal var articalLabel = UILabel()
    internal var totalLabel = UILabel()
    internal var totalAmauntLabel = UILabel()
    internal var imagePainting = UIImageView()
    internal var HStackIn = UIStackView()
    internal var trash = UIButton()

    static let cellIdentifier = "BuyCellView"

    override func updateViews() {
        guard let model = model as? BuyViewModel else { return }
        nameLabel.text = model.name
        autherLabel.text = model.auther
        articalLabel.text = "\(TitlesConstants.VendorCodeTitle) \(model.artical)"
        totalLabel.text = TitlesConstants.SumTitle
        totalAmauntLabel.text = model.totalAmaunt
        imagePainting.image = UIImage(named: model.img)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [HStackIn, trash].forEach({
            contentView.addSubview($0)
        })
        
        addViewConstraints()
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        setUpBase()
        setUpLabel(label: nameLabel, weight: .heavy)
        setUpLabel(label: autherLabel, numberOfLines: 0)
        setUpLabel(label: articalLabel, numberOfLines: 0)
        setUpLabel(label: totalLabel, numberOfLines: 0)
        setUpLabel(label: totalAmauntLabel, numberOfLines: 0)
        setUpImage(imageview: imagePainting)
        trash.setImage(UIImage(named: "trash"), for: .normal)
        setUpStack()
    }
    
    private func setUpStack() {
        HStackIn.axis  = .horizontal
        HStackIn.distribution  = .equalSpacing
        HStackIn.alignment = .center
        HStackIn.addArrangedSubview(
            createStack(axis: .horizontal,
                        distribution: .fill,
                        alignmentStack: .center,
                        spacing: 10,
                        views: imagePainting, createStack(alignmentStack: .leading,
                                                          views: autherLabel, nameLabel, articalLabel)
                        )
        )
        HStackIn.addArrangedSubview(createStack(alignmentStack: .center, views: totalLabel, totalAmauntLabel))
    }
}
