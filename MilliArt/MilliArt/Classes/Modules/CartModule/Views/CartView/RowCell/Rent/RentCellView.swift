//
//  RentCellView.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import UIKit

final class RentCellView: BaseCartCell {
    internal var nameLabel = UILabel()
    internal var autherLabel = UILabel()
    internal var articalLabel = UILabel()
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

    private func setUpStack() {
        HStackIn.axis  = .horizontal
        HStackIn.distribution  = .equalSpacing
        HStackIn.alignment = .center
        HStackIn.addArrangedSubview(
            CreateStack.createStack(
                axis: .horizontal,
                distribution: .fill,
                alignmentStack: .center,
                spacing: 10,
                views: imagePainting, CreateStack.createStack(
                    distribution: .equalSpacing,
                    alignmentStack: .leading,
                    spacing: 5,
                    views: autherLabel, nameLabel, articalLabel)
            )
        )
        HStackIn.addArrangedSubview(CreateStack.createStack(alignmentStack: .center, views: costLabel, amauntLabel))
        HStackIn.addArrangedSubview(CreateStack.createStack(alignmentStack: .center, views: rentLabel, countRentLabel))
        HStackIn.addArrangedSubview(CreateStack.createStack(alignmentStack: .center, views: totalLabel, totalAmauntLabel))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        setUpBase()
        setUpLabel(label: nameLabel, weight: .heavy, numberOfLines: 0)
        setUpLabel(label: autherLabel, numberOfLines: 0)
        setUpLabel(label: articalLabel, numberOfLines: 0)
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
