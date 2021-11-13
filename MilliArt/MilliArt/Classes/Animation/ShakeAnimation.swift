//
//  ShakeAnimation.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 13.11.2021.
//

import Foundation
import UIKit

final class ShakeAnimation {
    static func shakeAnimation(view: UIView) {
    let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
    animation.duration = 0.6
    animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        view.layer.add(animation, forKey: "shake")
    }
}
