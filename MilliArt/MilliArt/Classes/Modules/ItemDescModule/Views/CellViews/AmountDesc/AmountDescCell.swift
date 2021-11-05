//
//  AmountDescCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import UIKit

final class AmountDescCell: BaseCell {
    internal var amountLabel = UILabel()
    internal var monthCountLabel = UIButton()
    internal var rentLabel = UILabel()
    
    static let cellIdentifier = "AmountDescCellModel"
    
    override func updateViews() {
        guard let model = model as? AmountDescCellModel else {
            return
        }
        
        amountLabel.text = "Цена: \(model.amount) ₽"
        monthCountLabel.setAttributedTitle("Аренда на \(model.countRent) месяц".underLined, for: .normal)
        rentLabel.text = "Цена: \(model.rentPreMonth * model.countRent) ₽"
    }
    
    @objc
    private func clickPicker() {
        guard let model = model as? AmountDescCellModel else { return }
        model.action?()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [amountLabel, monthCountLabel, rentLabel].forEach( {contentView.addSubview($0)} )
        
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
        setUpFonts()
        setUpColor()
        setUptextAlignment()
        monthCountLabel.addTarget(self, action: #selector(clickPicker), for: .touchUpInside)
    }
    
    private func setUpFonts() {
        amountLabel.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.heavy)
        monthCountLabel.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.heavy)
        rentLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.heavy)
    }
    
    private func setUpColor() {
        amountLabel.textColor = ColorConstants.BlackColor
        rentLabel.textColor = ColorConstants.BlackColor
        monthCountLabel.setTitleColor(ColorConstants.BlackColor, for: .normal)
    }
    
    private func setUptextAlignment() {
        monthCountLabel.titleLabel?.textAlignment = .right
        rentLabel.textAlignment = .right
        amountLabel.textAlignment = .left
    }
}
