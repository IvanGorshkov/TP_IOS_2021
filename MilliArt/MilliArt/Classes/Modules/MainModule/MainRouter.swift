//
//  MainRouter.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import UIKit

final class MainRouter {
}

extension MainRouter: MainRouterInput {
    func itemSelected(with view: MainViewInput?) {
        guard let view = view as? UIViewController else { return }
        let itemDesc = ItemDescContainer.assemble(with: ItemDescContext())
        view.navigationController?.pushViewController(itemDesc.viewController, animated: true)
    }
}
