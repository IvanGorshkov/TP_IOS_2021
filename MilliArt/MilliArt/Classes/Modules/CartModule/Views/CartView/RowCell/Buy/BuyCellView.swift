//
//  RentCellView.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import UIKit

class BuyCellView: BaseCartCell {
    private var nameLabel = UILabel()
    private var autherLabel = UILabel()
    private var articalLabel = UILabel()
    private var totalLabel = UILabel()
    private var totalAmauntLabel = UILabel()
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
        ImageLoader.shared.image(with: model.img, completion: { img in
            self.imagePainting.image = img
        })
        if model.delete == nil {
            trash.isHidden = true
        }
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
        setUpLabel(label: nameLabel, weight: .heavy, numberOfLines: 0)
        setUpLabel(label: autherLabel, numberOfLines: 0)
        setUpLabel(label: articalLabel, numberOfLines: 0)
        setUpLabel(label: totalLabel, numberOfLines: 0)
        setUpLabel(label: totalAmauntLabel, numberOfLines: 0)
        setUpImage(imageview: imagePainting)
        trash.setImage(UIImage(named: "trash"), for: .normal)
        trash.addTarget(self, action: #selector(actionDelete), for: .touchUpInside)
        setUpStack()
    }
    @objc
    private func actionDelete() {
        guard let model = model as? BuyViewModel else { return }
        model.delete?(model.id)
    }
    
    private func setUpStack() {
        HStackIn.axis  = .horizontal
        HStackIn.distribution  = .fillProportionally
        HStackIn.alignment = .center
        HStackIn.addArrangedSubview(
            CreateStack.createStack(
                axis: .horizontal,
                distribution: .fill,
                alignmentStack: .center,
                spacing: 10,
                views: imagePainting, CreateStack.createStack(
                            distribution: .equalCentering,
                            alignmentStack: .leading,
                            views: autherLabel, nameLabel, articalLabel)
            )
        )
        HStackIn.addArrangedSubview(
            CreateStack.createStack(
                distribution: .fillEqually,
                alignmentStack: .center,
                views: totalLabel, totalAmauntLabel))
    }
}
