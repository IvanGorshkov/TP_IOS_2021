//
//  ButtonsDescCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 30.10.2021.
//

import UIKit

class ButtonsDescCell: BaseCell {
    var arButton = UIButton()
    var buyButton = UIButton()
    var rentButton = UIButton()
    var favButton = UIButton()

    static let cellIdentifier = "ButtonsDescCellModel"
    
    override func updateViews() {
        arButton.setImage(UIImage(named: "ar"), for: .normal)
        favButton.setImage(UIImage(named: "fav"), for: .normal)
        buyButton.setTitle(TitlesConstants.BuyTitle, for: .normal)
        rentButton.setTitle(TitlesConstants.RentTitle, for: .normal)
        
        arButton.addTarget(self, action: #selector(clickAR), for: .touchUpInside)
        favButton.addTarget(self, action: #selector(clickFav), for: .touchUpInside)
        buyButton.addTarget(self, action: #selector(clickBuy), for: .touchUpInside)
        rentButton.addTarget(self, action: #selector(clickRent), for: .touchUpInside)
    }
    
    @objc
    func clickAR() {
        guard let model = model as? ButtonsDescModelCell else {
            return
        }
        
        model.actionAR?()
    }
    
    @objc
    func clickFav() {
        guard let model = model as? ButtonsDescModelCell else {
            return
        }
        
        model.actionFav?()
    }
    
    @objc
    func clickBuy() {
        guard let model = model as? ButtonsDescModelCell else {
            return
        }
        
        model.actionBuy?()
    }
    
    @objc
    func clickRent() {
        guard let model = model as? ButtonsDescModelCell else {
            return
        }
        
        model.actionRent?()
    }
    
    func setUpButton(btn: UIButton) {
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.thin)
        btn.layer.borderWidth = 2
        btn.layer.borderColor = ColorConstants.MainPurpleColor.cgColor
        btn.layer.cornerRadius = btn.frame.size.height / 2
        btn.clipsToBounds = true
        btn.setTitleColor(ColorConstants.BlackColor, for: .normal)
        btn.setTitleColor( .white, for: .highlighted)
        btn.setBackgroundColor(color: ColorConstants.MainPurpleColor, forState: .highlighted)
        btn.setBackgroundColor(color: .clear, forState: .normal)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        sendSubviewToBack(contentView)
        setUpButton(btn: buyButton)
        setUpButton(btn: rentButton)
    }
    
    override func loadSubViews() {
        backgroundColor = .clear
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
        [arButton, buyButton, rentButton, favButton].forEach( {self.addSubview($0)} )
        arButton.translatesAutoresizingMaskIntoConstraints = false
        arButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        arButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        arButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        arButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        favButton.translatesAutoresizingMaskIntoConstraints = false
        favButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        favButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        favButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        favButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        buyButton.leadingAnchor.constraint(equalTo: arButton.trailingAnchor, constant: 10).isActive = true
        buyButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        rentButton.translatesAutoresizingMaskIntoConstraints = false
        rentButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        rentButton.trailingAnchor.constraint(equalTo: favButton.leadingAnchor, constant: -10).isActive = true
        rentButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        buyButton.widthAnchor.constraint(equalTo: rentButton.widthAnchor).isActive = true
        rentButton.leadingAnchor.constraint(equalTo: buyButton.trailingAnchor, constant: 10).isActive = true
     }
}

