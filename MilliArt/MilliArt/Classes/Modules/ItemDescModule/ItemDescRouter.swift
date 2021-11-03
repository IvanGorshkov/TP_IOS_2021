//
//  ItemDescRouter.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import UIKit
import ImageSlideshow

final class ItemDescRouter {
}

extension ItemDescRouter: ItemDescRouterInput {
    func openFullScreen(from vc: ItemDescViewInput?, silder: UIView?) {
         guard let view = vc as? ItemDescViewController, let silder = silder as? ImageSlideshow  else { return }
        silder.presentFullScreenController(from: view)
    }
    
    
    func goToAR(from vc: ItemDescViewInput?, arModel: PaintingARModel?) {
        guard let view = vc as? UIViewController, let arModel = arModel else { return }
        
        let itemDesc = ARContainer.assemble(with: ARContext(arModel: arModel))
        view.navigationController?.pushViewController(itemDesc.viewController, animated: true)
    }
    
}
