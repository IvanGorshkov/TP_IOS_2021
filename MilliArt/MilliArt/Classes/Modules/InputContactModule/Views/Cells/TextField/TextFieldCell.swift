//
//  TextFieldCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import UIKit

final class TextFieldCell: BaseCell {
    internal var textField = MUITextField()
    internal let line = UIView()
    internal let labelError = UILabel()
    private var errorFounded: Bool = false
    private var formatter: InputMaskProtocol?
    internal var verification: VerificationProtocol?
    static let cellIdentifier = "TextFieldCell"
    internal var myHeightAnchor: NSLayoutConstraint!
    
    override func updateViews() {
        guard let model = model as? InputTextFieldModelView else {
            return
        }
        textField.placeholder = model.placeholder
        let creater = CreatorForInput(textField: textField)
        verification = creater.factoryVerification(with: model.inputType)
        formatter = creater.factoryFormater(with: model.inputType)
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
        setUpTextField()
        setUpErrorLabel()
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
    
    private func setUpTextField() {
        textField.delegate = self
        textField.clearButtonMode = .whileEditing
        textField.textColor = ColorConstants.BlackColor
        textField.returnKeyType = .done
    }
    
    private func setUpErrorLabel() {
        labelError.text = TitlesConstants.ErrorInputTitle
        labelError.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.thin)
        labelError.textColor = .red
    }
    
    private func updateHeight(with error: Bool) {
        UIView.animate(withDuration: 0.2) {
            self.myHeightAnchor.constant = error ? 15 : 0
            self.contentView.layoutIfNeeded()
        }
    }
    
    private func isInputCorrect(_ verify: Bool) {
        line.backgroundColor = verify == true ? ColorConstants.BlackColor : .red
        line.layer.borderColor = verify == true ? ColorConstants.BlackColor.cgColor : UIColor.red.cgColor
        line.alpha = verify == true ? 0.2 : 1
        updateHeight(with: !verify)
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
                isInputCorrect(true)
                errorFounded = false
            } else {
                isInputCorrect(false)
                errorFounded = true
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let verification = verification else { return }
        if verification.verify(from: textField.text ?? "") {
            isInputCorrect(true)
        } else {
            isInputCorrect(false)
            errorFounded = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       textField.resignFirstResponder()
       return true
    }
}

extension TextFieldCell: ValidationCell {
    func validateCell() -> Bool {
        guard let verification = verification else { return false }
        if verification.verify(from: textField.text ?? "") {
            isInputCorrect(true)
            return true
        } else {
            isInputCorrect(false)
            errorFounded = true
            ShakeAnimation.shakeAnimation(view: contentView)
            return false
        }
    }
}

extension TextFieldCell: InputCellOutput {
    func getDataInput() -> CheckoutDataModel? {
        guard let model = model as? InputTextFieldModelView else {
            return nil
        }
        return  CheckoutDataModel(inputType: model.inputType, text: textField.text ?? "")
    }
}
