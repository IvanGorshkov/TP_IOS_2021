//
//  SearchRouter.swift
//  MilliArt
//
//  Created by Alekhin Sergey on 28.10.2021.
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
    
    func itemSelected(with view: SearchViewInput?, and id: Int) {
        guard let view = view as? UIViewController else { return }
        let itemDesc = ItemDescContainer.assemble(with: ItemDescContext(id: id))
        view.navigationController?.pushViewController(itemDesc.viewController, animated: true)
    }
}
