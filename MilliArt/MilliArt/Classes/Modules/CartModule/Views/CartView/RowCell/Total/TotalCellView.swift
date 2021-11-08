//
//  TotalCellView.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import UIKit

final class TotalCellView: BaseCell {
    internal var VStack = UIStackView()
    internal var totalLabel = UILabel()
    internal var artCountLabel = UILabel()
    internal var artsAmountLabel = UILabel()
    internal var shipingAmountLabel = UILabel()
    internal var totalAmountLabel = UILabel()
    internal var lineView = UIView()
    internal var lineView2 = UIView()
    static let cellIdentifier = "TotalCellView"

    override func updateViews() {
        guard let model = model as? TotalCartViewModel else {
            return
        }
        totalLabel.text = "Итого"
        artCountLabel.text = model.artCountLabel
        artsAmountLabel.text = model.artsAmountLabel
        shipingAmountLabel.text = model.shipingAmountLabel
        totalAmountLabel.text = model.totalAmountLabel
        
        [totalLabel,
         artCountLabel,
         artsAmountLabel,
         shipingAmountLabel,
         totalAmountLabel].forEach { label in
            label.textColor = ColorConstants.BlackColor
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [VStack].forEach({
            contentView.addSubview($0)
        })
        VStack.alignment = .trailing
        VStack.axis  = .vertical
        VStack.spacing  = 5
        VStack.distribution  = .equalSpacing
        
        selectionStyle = .none
        addViewConstraints()
        setUp()
        
        lineView.layer.borderWidth = 2.0
        lineView.layer.borderColor = UIColor.black.cgColor
        lineView.alpha = 0.5
        
        lineView2.layer.borderWidth = 2.0
        lineView2.layer.borderColor = UIColor.black.cgColor
        lineView2.alpha = 0.5
        VStack.addArrangedSubview(totalLabel)
        VStack.addArrangedSubview(createHStack(text: "Количество картин: ", label: artCountLabel))
        VStack.addArrangedSubview(createHStack(text: "Общая стоимость: ", label: artsAmountLabel))
        VStack.addArrangedSubview(lineView)
        VStack.addArrangedSubview(createHStack(text: "Доставка: ", label: shipingAmountLabel))
        VStack.addArrangedSubview(lineView2)
        VStack.addArrangedSubview(createHStack(text: "Итог: ", label: totalAmountLabel))
    }
        
    func createHStack(text: String, label: UILabel) -> UIStackView {
        let hStack = UIStackView()
        hStack.axis  = .horizontal
        let lbl = UILabel()
        lbl.text = text
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        label.textColor = ColorConstants.BlackColor
        lbl.textColor = ColorConstants.BlackColor
        hStack.addArrangedSubview(lbl)
        hStack.addArrangedSubview(label)
        return hStack
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        setUpBase()
    }

    private func setUpBase() {
        backgroundColor = .clear
    }
}
