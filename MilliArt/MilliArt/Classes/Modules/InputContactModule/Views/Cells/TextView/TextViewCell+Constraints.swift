//
//  TextViewCell+Constraints.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import UIKit

extension TextViewCell {
    internal func addConstraintsTextView() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
