//
//  RentCellView.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import UIKit

final class RentCellView: BaseCartCell {
    private var nameLabel = UILabel()
    private var autherLabel = UILabel()
    private var articalLabel = UILabel()
    private var costLabel = UILabel()
    private var amauntLabel = UILabel()
    private var rentLabel = UILabel()
    private var countRentLabel = UILabel()
    private var totalLabel = UILabel()
    private var totalAmauntLabel = UILabel()
    internal var imagePainting = UIImageView()
    internal var HStackIn = UIStackView()
    internal var trash = UIButton()

    static let cellIdentifier = "RentCellView"

    override func updateViews() {
        guard let model = model as? RentViewModel else {
            return
        }
        
        nameLabel.text = model.name
        autherLabel.text = model.auther
        articalLabel.text = "\(TitlesConstants.VendorCodeTitle) \(model.artical)"
        costLabel.text = TitlesConstants.RentCost
        amauntLabel.text = model.amaunt
        rentLabel.text = TitlesConstants.RentCount
        countRentLabel.text = model.countRent
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
        HStackIn.addArrangedSubview(createStack(alignmentStack: .center, views: costLabel, amauntLabel))
        HStackIn.addArrangedSubview(createStack(alignmentStack: .center, views: rentLabel, countRentLabel))
        HStackIn.addArrangedSubview(createStack(alignmentStack: .center, views: totalLabel, totalAmauntLabel))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        setUpBase()
        setUpLabel(label: nameLabel, weight: .heavy)
        setUpLabel(label: autherLabel)
        setUpLabel(label: articalLabel)
        setUpLabel(label: costLabel)
        setUpLabel(label: amauntLabel)
        setUpLabel(label: rentLabel)
        setUpLabel(label: countRentLabel)
        setUpLabel(label: totalLabel)
        setUpLabel(label: totalAmauntLabel)
        setUpImage(imageview: imagePainting)
        setUpStack()
        trash.setImage(UIImage(named: "trash"), for: .normal)
        trash.addTarget(self, action: #selector(actionDelete), for: .touchUpInside)
    }
    
    @objc
    private func actionDelete() {
        guard let model = model as? RentViewModel else { return }
        model.delete?(model.id)
    }
}
