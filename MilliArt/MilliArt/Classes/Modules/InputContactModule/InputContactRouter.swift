//
//  InputContactModuleRouter.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 11.11.2021.
//  
//

import UIKit

final class InputContactRouter {
}

extension InputContactRouter: InputContactRouterInput {
    func goToOrder(from vc: InputContactViewInput?, orderNumber: Int) {
        guard let view = vc as? UIViewController else { return }
        let conteiner = OrderContainer.assemble(with: OrderContext( numberOrder: orderNumber))
        view.present(conteiner.viewController, animated: true, completion: nil)
        view.navigationController?.popToRootViewController(animated: false)
    }
}
