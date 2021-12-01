//
//  CreateStack.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 13.11.2021.
//

import UIKit

final class CreateStack {
   static func createStack(axis: NSLayoutConstraint.Axis = .vertical,
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
