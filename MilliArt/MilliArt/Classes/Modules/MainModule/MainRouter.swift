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
    func goToAllAuthor(with view: MainViewInput?) {
        guard let view = view as? UIViewController else { return }
        let container = AllContainer.assemble(with: AllContext(caseAll: .allAuthors))
        view.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func goToAllCompilation(with view: MainViewInput?) {
        guard let view = view as? UIViewController else { return }
        let container = AllContainer.assemble(with: AllContext(caseAll: .allCompilations))
        view.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func itemSelected(with view: MainViewInput?) {
        guard let view = view as? UIViewController else { return }
        let itemDesc = ItemDescContainer.assemble(with: ItemDescContext())
        view.navigationController?.pushViewController(itemDesc.viewController, animated: true)
    }
}
