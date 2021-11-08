//
//  RentCellView.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import UIKit

final class BuyCellView: BaseCell {
    internal var nameLabel = UILabel()
    internal var autherLabel = UILabel()
    internal var articalLabel = UILabel()
    internal var totalLabel = UILabel()
    internal var totalAmauntLabel = UILabel()
    internal var imagePainting = UIImageView()
    internal var HStackIn = UIStackView()
    internal var HStackIn2 = UIStackView()
    internal var VStack = UIStackView()
    internal var VStack4 = UIStackView()
    internal var trash = UIButton()

    static let cellIdentifier = "BuyCellView"

    override func updateViews() {
        guard let model = model as? BuyViewModel else {
            return
        }
        nameLabel.text = model.name
        autherLabel.text = model.auther
        articalLabel.text = model.articalTitle
        totalLabel.text = model.total
        totalAmauntLabel.text = model.totalAmaunt
        imagePainting.image = UIImage(named: model.img)
        
        [nameLabel,
         autherLabel,
        articalLabel,
         totalLabel,
         totalAmauntLabel].forEach { label in
            label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
            label.textColor = ColorConstants.BlackColor
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [HStackIn, trash].forEach({
            contentView.addSubview($0)
        })
        
        selectionStyle = .none
        HStackIn.axis  = .horizontal
        HStackIn.distribution  = .equalSpacing
        HStackIn.alignment = .center
        
        HStackIn2.axis  = .horizontal
        HStackIn2.distribution  = .fill
        HStackIn2.alignment = .center
        HStackIn2.spacing = 10
        
        VStack.axis  = .vertical
        VStack.distribution  = .fillEqually
        VStack.alignment = .leading
        VStack.spacing = 5
        
        VStack4.axis  = .vertical
        VStack4.distribution  = .fillEqually
        VStack4.alignment = .center
        
        VStack.addArrangedSubview(autherLabel)
        VStack.addArrangedSubview(nameLabel)
        VStack.addArrangedSubview(articalLabel)
        
        HStackIn2.addArrangedSubview(imagePainting)
        HStackIn2.addArrangedSubview(VStack)
        
        VStack4.addArrangedSubview(totalLabel)
        VStack4.addArrangedSubview(totalAmauntLabel)
        
        HStackIn.addArrangedSubview(HStackIn2)
        HStackIn.addArrangedSubview(VStack4)
        
        addViewConstraints()
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        setUpBase()
        setUpLabel()
        setUpArrow()
        trash.setImage(UIImage(named: "trash"), for: .normal)
    }

    private func setUpBase() {
        backgroundColor = .clear
        separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }

    private func setUpLabel() {
        nameLabel.numberOfLines = 0
        nameLabel.textColor = ColorConstants.BlackColor
        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.heavy)
    }
    
    private func setUpArrow() {
        imagePainting.contentMode = .scaleAspectFill
        imagePainting.clipsToBounds = true
        imagePainting.layer.cornerRadius = 10
    }
}
