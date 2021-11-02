//
//  ARRouter.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 31.10.2021.
//  
//

import UIKit

final class ARRouter {
}

extension ARRouter: ARRouterInput {
    func goToAR(from vc: ARViewInput?, arModel: ARViewModel?, presenter: AREditModuleOutput) {
        guard let view = vc as? UIViewController, let arModel = arModel else { return }
        let context = AREditContext(moduleOutput: presenter, arViewModel: arModel)
        
        let aredit = AREditContainer.assemble(with: context)
        view.present(aredit.viewController, animated: true, completion: nil)
    }
    
}
