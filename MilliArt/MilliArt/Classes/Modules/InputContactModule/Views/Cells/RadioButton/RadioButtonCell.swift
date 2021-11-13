//
//  TextFieldCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import UIKit

final class RadioButtonCell: BaseCell {
    var verification: VerificationProtocol?
    internal var verticalStack = UIStackView()
    static let cellIdentifier = "RadioButtonCell"
    internal var multiRadioButton = [UIButton]() {
        didSet {
            multiRadioButton.forEach { (button) in
                button.setImage(UIImage(named: "radioOff"), for: .normal)
                button.setImage(UIImage(named: "radioOn"), for: .selected)
            }
        }
    }
    
    override func updateViews() {
        guard let model = model as? RadioButtonViewModel else {
            return
        }
        var btns: [UIButton] = []
        var i = 0
        model.radioNames.forEach { str in
            let btn = createButton(tag: i)
            let lbl = createLabel(tag: i, str: str)
            btns.append(btn)
            verticalStack.addArrangedSubview(
                CreateStack.createStack(axis: .horizontal, distribution: .equalSpacing, alignmentStack: .leading, views: btn, lbl))
            i += 1
        }
        
        multiRadioButton = btns
    }
    
    @objc
    private func payMethodAction(_ sender: Any) {
        uncheck()
        var tag = 0
        if let sender = sender as? UITapGestureRecognizer { tag = sender.view?.tag ?? 0 }
        if let sender = sender as? UIButton {  tag = sender.tag }
        
        multiRadioButton[tag].adjustsImageWhenHighlighted = false
        multiRadioButton[tag].isHighlighted = false
        multiRadioButton[tag].isSelected = !self.isSelected
    }
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(verticalStack)
        setUp()
        addConstraintsStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createButton(tag: Int) -> UIButton {
        let btn = UIButton()
        btn.tag = tag
        btn.addTarget(self, action: #selector(payMethodAction(_:)), for: .touchUpInside)
        return btn
    }
    
    private func createLabel(tag: Int, str: String) -> UILabel {
        let lbl = UILabel()
        lbl.text = str
        lbl.textColor = ColorConstants.BlackColor
        lbl.tag = tag
        let tap = UITapGestureRecognizer(target: self, action: #selector(payMethodAction(_:)))
        lbl.isUserInteractionEnabled = true
        lbl.addGestureRecognizer(tap)
        return lbl
    }
    
    private func setUp() {
        setUpBase()
        setUpStack()
    }
    
    private func setUpBase() {
        backgroundColor = .clear
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
        selectionStyle = .none
    }
    
    private func uncheck() {
        multiRadioButton.forEach { (button) in
            button.isSelected = false
        }
    }
    
    private func setUpStack() {
        verticalStack.axis  = .vertical
        verticalStack.distribution  = .fillProportionally
        verticalStack.alignment = .leading
    }
}

extension RadioButtonCell: ValidationCell {
    func validateCell() -> Bool {
        for button in multiRadioButton where button.isSelected {
            return true
        }
        
        ShakeAnimation.shakeAnimation(view: verticalStack)
        return false
    }
}

extension RadioButtonCell: InputCellOutput {
    func getDataInput() -> CheckoutDataModel? {
        var text = ""
        multiRadioButton.forEach { (button) in
           if button.isSelected {
               text = "\(button.tag)"
           }
        }
        return  CheckoutDataModel(inputType: .payMethod, text: text)
    }
}
