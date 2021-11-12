//
//  OrderContainer.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 12.11.2021.
//  
//

import UIKit

final class OrderContainer {
    let input: OrderModuleInput
	let viewController: UIViewController
	private(set) weak var router: OrderRouterInput!

	class func assemble(with context: OrderContext) -> OrderContainer {
        let router = OrderRouter()
        let interactor = OrderInteractor()
        let presenter = OrderPresenter(router: router, interactor: interactor)
		let viewController = OrderViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter
        interactor.numberOrder = context.numberOrder
        
        return OrderContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: OrderModuleInput, router: OrderRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct OrderContext {
	weak var moduleOutput: OrderModuleOutput?
    let numberOrder: Int
}
