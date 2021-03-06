//
//  ButtonsDescCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 30.10.2021.
//

import UIKit

final class ButtonsDescCell: BaseCell {
    internal var arButton = UIButton()
    internal var buyButton = UIButton()
    internal var rentButton = UIButton()
    internal var soldButton = UIButton()
    internal var favButton = UIButton()

    static let cellIdentifier = "ButtonsDescCellModel"

    override func updateViews() {
        arButton.setImage(UIImage(named: "ar"), for: .normal)
        favButton.setImage(UIImage(named: "fav"), for: .normal)
        buyButton.setTitle(TitlesConstants.BuyTitle, for: .normal)
        rentButton.setTitle(TitlesConstants.RentTitle, for: .normal)
        buyButton.setTitle(TitlesConstants.InCartTitle, for: .selected)
        rentButton.setTitle(TitlesConstants.InCartTitle, for: .selected)
        soldButton.setTitle("Продано", for: .normal)
        
        guard let model = model as? ButtonsDescModelCell else { return }
        soldButton.isHidden = true
        if model.selected {
            if model.isRent {
                rentButton.isSelected = true
            } else {
                buyButton.isSelected = true
            }
        } else {
            rentButton.isSelected = false
            buyButton.isSelected = false
        }
        
        rentButton.isHidden = !model.isAvalible ? true : false
        buyButton.isHidden = !model.isAvalible ? true : false
        soldButton.isHidden = !model.isAvalible ? false : true
        soldButton.isEnabled = !model.isAvalible ? false : true
    }

    @objc
    private func clickAR() {
        guard let model = model as? ButtonsDescModelCell else { return }
        model.actionAR?()
    }

    @objc
    private func clickFav() {
        guard let model = model as? ButtonsDescModelCell else { return }
        model.actionFav?()
    }

    @objc
    private func clickBuy() {
        guard let model = model as? ButtonsDescModelCell else { return }
        
        buyButton.isSelected = !buyButton.isSelected
        rentButton.isSelected = false
        
        model.actionBuy?(buyButton.isSelected)
    }

    @objc
    private func clickRent() {
        guard let model = model as? ButtonsDescModelCell else { return }
        
        rentButton.isSelected = !rentButton.isSelected
        buyButton.isSelected = false
        
        model.actionRent?(rentButton.isSelected)
    }

    private func setUpButton(btn: UIButton) {
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.thin)
        btn.layer.borderWidth = 2
        btn.layer.borderColor = ColorConstants.MainPurpleColor.cgColor
        btn.clipsToBounds = true
        btn.setTitleColor(ColorConstants.BlackColor, for: .normal)
        btn.setTitleColor( .white, for: .highlighted)
        btn.setTitleColor( .white, for: .selected)
        btn.setBackgroundColor(color: ColorConstants.MainPurpleColor, forState: .highlighted)
        btn.setBackgroundColor(color: ColorConstants.MainPurpleColor, forState: .selected)
        btn.setBackgroundColor(color: .clear, forState: .normal)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setUpCornerRadius(btn: buyButton)
        setUpCornerRadius(btn: rentButton)
        setUpCornerRadius(btn: soldButton)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [arButton, buyButton, rentButton, favButton, soldButton].forEach({ contentView.addSubview($0)
        })

        addConstraints()
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        setUpBase()
        setUpUIElements()
    }

    private func setUpBase() {
        backgroundColor = .clear
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
    }

    private func setUpUIElements() {
        [(arButton, #selector(clickAR)),
         (favButton, #selector(clickFav)),
         (buyButton, #selector(clickBuy)),
         (rentButton, #selector(clickRent))
        ].forEach { $0.0.addTarget(self, action: $0.1, for: .touchUpInside) }
        setUpButton(btn: buyButton)
        setUpButton(btn: rentButton)
        setUpButton(btn: soldButton)
    }

    private func setUpCornerRadius(btn: UIButton) {
        btn.layer.cornerRadius = btn.frame.size.height / 2
    }
}
