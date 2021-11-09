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
    
    static let cellIdentifier = "TotalCellView"

    override func updateViews() {
        guard let model = model as? TotalCartViewModel else {
            return
        }
        totalLabel.text = TitlesConstants.TotalLabel
        artCountLabel.text = model.artCount
        artsAmountLabel.text = model.artsAmount
        shipingAmountLabel.text = model.shipingAmount
        totalAmountLabel.text = model.totalAmount
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [VStack].forEach({ [weak self] in
            self?.contentView.addSubview($0)
        })
        
        addViewConstraints()
        setUp()
    }
        
    func createHStack(text: String = "", label: UILabel, fontSize: CGFloat = 18) -> UIStackView {
        let hStack = UIStackView()
        hStack.axis  = .horizontal
        label.font = UIFont.systemFont(ofSize: fontSize, weight: UIFont.Weight.bold)
        label.textColor = ColorConstants.BlackColor
        if !text.isEmpty {
            let lbl = UILabel()
            lbl.text = text
            lbl.textColor = ColorConstants.BlackColor
            hStack.addArrangedSubview(lbl)
        }
        hStack.addArrangedSubview(label)
        return hStack
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        setUpBase()
        setUpVStack()
    }
    
    private func setUpLine(view: UIView) {
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.black.cgColor
        view.alpha = 0.5
    }
    
    func createLine() -> UIView {
        let line = UIView()
        setUpLine(view: line)
        addLineConstraints(view: line)
        return line
    }
    private func setUpBase() {
        backgroundColor = .clear
        selectionStyle = .none
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
    }
    
    private func setUpVStack() {
        VStack.alignment = .trailing
        VStack.axis  = .vertical
        VStack.spacing  = 5
        VStack.distribution  = .equalSpacing
        
        VStack.addArrangedSubview(createHStack(label: totalLabel, fontSize: 22))
        VStack.addArrangedSubview(createHStack(text: TitlesConstants.TotalCountLabel, label: artCountLabel))
        VStack.addArrangedSubview(createHStack(text: TitlesConstants.TotalCostLabel, label: artsAmountLabel))
        VStack.addArrangedSubview(createLine())
        VStack.addArrangedSubview(createHStack(text: TitlesConstants.TotalShippingLabel, label: shipingAmountLabel))
        VStack.addArrangedSubview(createLine())
        VStack.addArrangedSubview(createHStack(text: TitlesConstants.TotalAmountLabel, label: totalAmountLabel))
    }
}
