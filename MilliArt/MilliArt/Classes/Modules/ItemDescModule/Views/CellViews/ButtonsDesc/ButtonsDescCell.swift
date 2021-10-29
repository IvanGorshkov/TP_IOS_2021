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
    internal var favButton = UIButton()

    static let cellIdentifier = "ButtonsDescCellModel"
    
    override func updateViews() {
        arButton.setImage(UIImage(named: "ar"), for: .normal)
        favButton.setImage(UIImage(named: "fav"), for: .normal)
        buyButton.setTitle(TitlesConstants.BuyTitle, for: .normal)
        rentButton.setTitle(TitlesConstants.RentTitle, for: .normal)
    }
    
    @objc
    func clickAR() {
        guard let model = model as? ButtonsDescModelCell else { return }
        model.actionAR?()
    }
    
    @objc
    func clickFav() {
        guard let model = model as? ButtonsDescModelCell else { return }
        model.actionFav?()
    }
    
    @objc
    func clickBuy() {
        guard let model = model as? ButtonsDescModelCell else { return  }
        model.actionBuy?()
    }
    
    @objc
    func clickRent() {
        guard let model = model as? ButtonsDescModelCell else { return }
        model.actionRent?()
    }
    
    private func setUpButton(btn: UIButton) {
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.thin)
        btn.layer.borderWidth = 2
        btn.layer.borderColor = ColorConstants.MainPurpleColor.cgColor
        btn.clipsToBounds = true
        btn.setTitleColor(ColorConstants.BlackColor, for: .normal)
        btn.setTitleColor( .white, for: .highlighted)
        btn.setBackgroundColor(color: ColorConstants.MainPurpleColor, forState: .highlighted)
        btn.setBackgroundColor(color: .clear, forState: .normal)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setUpCornerRadius(btn: buyButton)
        setUpCornerRadius(btn: rentButton)
    }
    
    override func loadSubViews() {
        setUp()
        addConstraints()
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
        [arButton, buyButton, rentButton, favButton].forEach( { contentView.addSubview($0)} )
        [(arButton, #selector(clickAR)),
         (favButton, #selector(clickFav)),
         (buyButton, #selector(clickBuy)),
         (rentButton, #selector(clickRent))].forEach { $0.0.addTarget(self, action: $0.1, for: .touchUpInside) }
        setUpButton(btn: buyButton)
        setUpButton(btn: rentButton)
    }
    
    private func setUpCornerRadius(btn: UIButton) {
        btn.layer.cornerRadius = btn.frame.size.height / 2
    }
}
