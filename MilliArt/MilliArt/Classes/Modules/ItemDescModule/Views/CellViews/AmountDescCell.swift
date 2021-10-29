//
//  AmountDescCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import UIKit

class AmountDescCell: BaseCell {
    var amountLabel = UILabel()
    var monthCountLabel = UILabel()
    var rentLabel = UILabel()

    static let cellIdentifier = "AmountDescCellModel"
    
    override func updateViews() {
        guard let model = model as? AmountDescCellModel else {
            return
        }
        amountLabel.text = "Цена: \(model.amount) ₽"
        monthCountLabel.text = "Аренда на 1 месяц"
        rentLabel.text = "Цена: \(model.rentPreMonth) ₽"

    }
    

    override func loadSubViews() {
        backgroundColor = .clear
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
        [amountLabel, monthCountLabel, rentLabel].forEach( {self.addSubview($0)} )
        
        
        amountLabel.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.heavy)
        monthCountLabel.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.heavy)
        rentLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.heavy)
        amountLabel.textColor = ColorConstants.BlackColor
        monthCountLabel.textColor = ColorConstants.BlackColor
        rentLabel.textColor = ColorConstants.BlackColor
        
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        amountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        
        monthCountLabel.translatesAutoresizingMaskIntoConstraints = false
        monthCountLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        monthCountLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        
        rentLabel.translatesAutoresizingMaskIntoConstraints = false
        rentLabel.topAnchor.constraint(equalTo: monthCountLabel.bottomAnchor, constant: 10).isActive = true
        rentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        rentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        
        
        monthCountLabel.textAlignment = .right
        rentLabel.textAlignment = .right
    }
}
