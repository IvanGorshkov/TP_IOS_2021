//
//  TextFieldCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import UIKit

final class RadioButtonCell: BaseCell, ValidationCell, InputCellOutput {
    func getDataInput() -> CheckoutDataModel? {
        var text = ""
        multiRadioButton.forEach { (button) in
           if button.isSelected {
               text = "\(button.tag)"
           }
        }
        return  CheckoutDataModel(inputType: .payMethod, text: text)
    }
    
    var verification: VerificationProtocol?

    func validateCell() -> Bool {
        var found = false
        multiRadioButton.forEach { (button) in
           if button.isSelected {
               found = true
           }
        }
        if !found {
            let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            animation.duration = 0.6
            animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
            verticalStack.layer.add(animation, forKey: "shake")
        }
        return found
    }
    
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
            let btn = UIButton()
            let lbl = UILabel()
            lbl.text = str
            lbl.textColor = ColorConstants.BlackColor
           // btn.setTitle(str, for: .normal)
            btns.append(btn)
            btn.tag = i
            lbl.tag = i
            btn.addTarget(self, action: #selector(payMethodAction(_:)), for: .touchUpInside)
            let tap = UITapGestureRecognizer(target: self, action: #selector(payMethodAction(_:)))
            tap.view?.tag = i
            lbl.isUserInteractionEnabled = true
            lbl.addGestureRecognizer(tap)
            
            verticalStack.addArrangedSubview(
                createStack(axis: .horizontal, distribution: .equalSpacing, alignmentStack: .leading, views: btn, lbl))
            i += 1
        }
        
        multiRadioButton = btns
    }
    
    @objc
    private func payMethodAction(_ sender: Any) {
        uncheck()
        if let sender = sender as? UITapGestureRecognizer {
            multiRadioButton[sender.view?.tag ?? 0].adjustsImageWhenHighlighted = false
            multiRadioButton[sender.view?.tag ?? 0].isHighlighted = false
            multiRadioButton[sender.view?.tag ?? 0].isSelected = !self.isSelected
        }
        
        if let sender = sender as? UIButton {
            multiRadioButton[sender.tag].adjustsImageWhenHighlighted = false
            multiRadioButton[sender.tag].isHighlighted = false
            multiRadioButton[sender.tag].isSelected = !self.isSelected
        }
    }
    
    func uncheck() {
        multiRadioButton.forEach { (button) in
            button.isSelected = false
        }
    }
    private func setUpStack() {
        verticalStack.axis  = .vertical
        verticalStack.distribution  = .fillProportionally
        verticalStack.alignment = .leading
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(verticalStack)
        setUp()
        addConstraintsName()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    func createStack(axis: NSLayoutConstraint.Axis = .vertical,
                     distribution: UIStackView.Distribution = .fillEqually,
                     alignmentStack: UIStackView.Alignment,
                     spacing: CGFloat = 5,
                     views: UIView...) -> UIStackView {
        let stack = UIStackView()
        stack.axis = axis
        stack.distribution = distribution
        stack.alignment = alignmentStack
        stack.spacing = spacing
        views.forEach { view in
            stack.addArrangedSubview(view)
        }
        return stack
    }
}
