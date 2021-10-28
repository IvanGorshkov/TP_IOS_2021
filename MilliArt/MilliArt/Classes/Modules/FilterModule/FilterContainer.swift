//
//  FilterContainer.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import UIKit

final class FilterContainer {
    let input: FilterModuleInput
	let viewController: UIViewController
	private(set) weak var router: FilterRouterInput!

	class func assemble(with context: FilterContext) -> FilterContainer {
        let router = FilterRouter()
        let interactor = FilterInteractor()
        let presenter = FilterPresenter(router: router, interactor: interactor)
		let viewController = FilterViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return FilterContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: FilterModuleInput, router: FilterRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct FilterContext {
	weak var moduleOutput: FilterModuleOutput?
}
