//
//  RentPickerView.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 30.10.2021.
//

import UIKit

class RentPickerView: UIView {

    internal let picker = UIPickerView(frame: .zero)
    internal let button = UIButton(frame: .zero)

    let buttonName: String = TitlesConstants.Done

    override init(frame: CGRect) {
        super.init(frame: frame)
        didLoad()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        didLoad()
    }

    private func didLoad() {

        self.addSubview(picker)
        self.addSubview(button)

        picker.backgroundColor = ColorConstants.BlackColor.withAlphaComponent(0.5)
        picker.frame = .zero

        button.setTitle(buttonName, for: .normal)
        button.contentHorizontalAlignment = .right
        button.contentVerticalAlignment = .top
        button.isSelected = true

        layer.cornerRadius = 20
        clipsToBounds = true
        self.updateConstraints()
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(blurEffectView, belowSubview: picker)
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if self.point(inside: point, with: event) {
            return super.hitTest(point, with: event)
        }
        guard isUserInteractionEnabled, !isHidden, alpha > 0 else {
            return nil
        }

        for subview in subviews.reversed() {
            let convertedPoint = subview.convert(point, from: self)
            if let hitView = subview.hitTest(convertedPoint, with: event) {
                return hitView
            }
        }
        return nil
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    override func updateConstraints() {
        super.updateConstraints()
        addConstraintRentPickerView()
    }
}
