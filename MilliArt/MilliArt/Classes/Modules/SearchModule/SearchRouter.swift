//
//  SearchRouter.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import UIKit

final class SearchRouter {
}

extension SearchRouter: SearchRouterInput {
    func goToFilterVC(from vc: SearchViewInput?) {
        guard let vc = vc as? UIViewController else { return }
        let filterContainer = FilterContainer.assemble(with: FilterContext())
        vc.present(filterContainer.viewController, animated: true, completion: nil)
    }
}
