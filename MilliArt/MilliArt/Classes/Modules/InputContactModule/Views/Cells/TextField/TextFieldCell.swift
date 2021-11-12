//
//  TextFieldCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import UIKit

final class TextFieldCell: BaseCell, ValidationCell, InputCellOutput {
    internal var textField = MUITextField()
    internal let line = UIView()
    internal let labelError = UILabel()
    private var errorFounded: Bool = false
    private var formatter: InputMaskProtocol?
    internal var verification: VerificationProtocol?
    static let cellIdentifier = "TextFieldCell"

    internal var myHeightAnchor: NSLayoutConstraint!
    
    func getDataInput() -> CheckoutDataModel? {
        guard let model = model as? InputTextFieldModelView else {
            return nil
        }
        return  CheckoutDataModel(inputType: model.inputType, text: textField.text ?? "")
    }
    
    override func updateViews() {
        guard let model = model as? InputTextFieldModelView else {
            return
        }
        textField.placeholder = model.placeholder
        textField.delegate = self
        textField.clearButtonMode = .whileEditing
        textField.textColor = ColorConstants.BlackColor
        labelError.text = "Данные указаны неверно"
        labelError.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.thin)
        labelError.textColor = .red
        if model.inputType == .tel {
            formatter = PhoneFormatter()
            verification = PhoneVerification()
            textField.keyboardType = .phonePad
        }
        if model.inputType == .name {
            verification = NameVerification()
        }
        if model.inputType == .email {
            verification = EmailVerification()
            textField.keyboardType = .emailAddress
        }
        if model.inputType == .address {
            verification = AdressVerification()
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [textField, line, labelError].forEach({
            contentView.addSubview($0)
        })
        
        addConstraintsName()
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        setUpBase()
        setUpLine()
    }
    
    private func setUpLine() {
        line.layer.borderWidth = 1.0
        line.layer.borderColor = UIColor.black.cgColor
        line.alpha = 0.2
    }
    
    private func setUpBase() {
        backgroundColor = .clear
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
        selectionStyle = .none
    }
    
    private func updateHeight(with error: Bool) {
        UIView.animate(withDuration: 0.2) {
            if error {
                self.myHeightAnchor.constant = 15
            } else {
                self.myHeightAnchor.constant = 0
            }
            self.contentView.layoutIfNeeded()
        }
    }
}

extension TextFieldCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let formatter = formatter else { return true }
        return formatter.mask(textField, range: range, replacementString: string)
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if errorFounded {
            guard let verification = verification else { return }
            if verification.verify(from: textField.text ?? "") {
                line.backgroundColor = .black
                line.layer.borderColor = UIColor.black.cgColor
                line.alpha = 0.2
                updateHeight(with: false)
                errorFounded = false
            } else {
                line.backgroundColor = .red
                line.layer.borderColor = UIColor.red.cgColor
                line.alpha = 1
                updateHeight(with: true)
                errorFounded = true
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let verification = verification else { return }
        if verification.verify(from: textField.text ?? "") {
            line.backgroundColor = .black
            line.layer.borderColor = UIColor.black.cgColor
            line.alpha = 0.2
            updateHeight(with: false)
        } else {
            line.backgroundColor = .red
            line.layer.borderColor = UIColor.red.cgColor
            line.alpha = 1
            updateHeight(with: true)
            errorFounded = true
        }
    }
    
    func validateCell() -> Bool {
        guard let verification = verification else { return false }
        if verification.verify(from: textField.text ?? "") {
            line.backgroundColor = .black
            line.layer.borderColor = UIColor.black.cgColor
            line.alpha = 0.2
            updateHeight(with: false)
            return true
        } else {
            line.backgroundColor = .red
            line.layer.borderColor = UIColor.red.cgColor
            line.alpha = 1
            updateHeight(with: true)
            errorFounded = true
            
            let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            animation.duration = 0.6
            animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
            contentView.layer.add(animation, forKey: "shake")
            
            return false
        }
    }
}
