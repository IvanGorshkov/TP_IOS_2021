//
//  CompilationRouter.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 01.12.2021.
//  
//

import UIKit

final class CompilationRouter {
}

extension CompilationRouter: CompilationRouterInput {
    func itemSelected(with view: CompilationViewInput?, and id: Int) {
        guard let view = view as? UIViewController else { return }
        let itemDesc = ItemDescContainer.assemble(with: ItemDescContext(id: id))
        view.navigationController?.pushViewController(itemDesc.viewController, animated: true)
    }
}
