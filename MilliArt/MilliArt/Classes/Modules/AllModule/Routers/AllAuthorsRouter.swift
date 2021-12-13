//
//  AllAuthorsRouter.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 05.11.2021.
//  
//

import UIKit

final class AllAuthorsRouter {
}

extension AllAuthorsRouter: AllRouterInput {
    func itemSelected(with view: AllViewInput?, title: String, and id: Int) {
        guard let view = view as? UIViewController else { return }
        let compilation = AuthorContainer.assemble(with: AuthorContext())
        view.navigationController?.pushViewController(compilation.viewController, animated: true)
    }
}
