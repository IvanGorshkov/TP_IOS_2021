//
//  TextFieldCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import UIKit

final class TextViewCell: BaseCell {
    internal var textView = UITextView()
    static let cellIdentifier = "TextViewCell"
    
    override func updateViews() {
        guard let model = model as? InputTextViewModelView else {
            return
        }
        textView.text = model.placeholder
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [textView].forEach({
            contentView.addSubview($0)
        })
        
        addConstraintsTextView()
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        setUpBase()
        setUpTextView()
    }
    
    private func setUpBase() {
        backgroundColor = .clear
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
        selectionStyle = .none
    }
    
    private func setUpTextView() {
        textView.backgroundColor = .clear
        textView.textColor = ColorConstants.BlackColor
        textView.layer.borderWidth = 1
        textView.layer.borderColor = ColorConstants.BlackColor.withAlphaComponent(0.2).cgColor
        textView.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textView.delegate = self
        textView.textColor = UIColor.lightGray
    }
}

extension TextViewCell: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if !textView.text.isEmpty && textView.text == TitlesConstants.CommentPlaceholder {
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = TitlesConstants.CommentPlaceholder
            textView.textColor = UIColor.lightGray
        }
    }
}

extension TextViewCell: InputCellOutput {
    func getDataInput() -> CheckoutDataModel? {
        return  CheckoutDataModel(inputType: .comment, text: textView.text)
    }
}
