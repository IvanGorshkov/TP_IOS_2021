//
//  AREditRouter.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 01.11.2021.
//  
//

import UIKit

final class AREditRouter {
}

extension AREditRouter: AREditRouterInput {
    func back(_ vc: AREditViewInput?) {
        guard let view = vc as? UIViewController else { return }
        view.dismiss(animated: true, completion: nil)
    }
}
