//
//  AboutDescCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import UIKit

class AboutDescCell: BaseCell {
    var descriptionLabel = UILabel()
    var stringValue: String? {
        didSet {
            descriptionLabel.attributedText = textWithLineSpace(text: stringValue ?? "")
        }
    }
    static let cellIdentifier = "AboutDescCellModel"
    
    
    override func updateViews() {
        guard let model = model as? AboutDescCellModel else {
            return
        }
        stringValue = "\(TitlesConstants.AboutTitle)\n\(model.text)"
        
    }
    
    
    override func loadSubViews() {
        backgroundColor = .clear
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
        self.addSubview(descriptionLabel)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.thin)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.lineBreakMode = .byWordWrapping
        
        descriptionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 20).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: super.trailingAnchor, constant: -10).isActive = true
    }
    
    private func textWithLineSpace(text: String, lineSpacing: CGFloat = 5) -> NSAttributedString? {
        let attrString = NSMutableAttributedString(string: text)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: text.count))
        return attrString
    }
}
