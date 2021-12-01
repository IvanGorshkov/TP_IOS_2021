//
//  AllCompilationsRouter.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 05.11.2021.
//  
//

import UIKit

final class AllCompilationsRouter {
}

extension AllCompilationsRouter: AllRouterInput {
    func itemSelected(with view: AllViewInput?, title: String, and id: Int) {
        guard let view = view as? UIViewController else { return }
        let compilation = CompilationContainer.assemble(with: CompilationContext(id: id, title: title))
        view.navigationController?.pushViewController(compilation.viewController, animated: true)
    }
}
