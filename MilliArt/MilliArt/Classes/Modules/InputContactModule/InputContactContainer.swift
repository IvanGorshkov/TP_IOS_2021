//
//  InputContactModuleContainer.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 11.11.2021.
//  
//

import UIKit

final class InputContactContainer {
    let input: InputContactModuleInput
	let viewController: UIViewController
	private(set) weak var router: InputContactRouterInput!

	class func assemble(with context: InputContactContext) -> InputContactContainer {
        let router = InputContactRouter()
        let interactor = InputContactInteractor()
        let presenter = InputContactPresenter(router: router, interactor: interactor)
		let viewController = InputContactViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter
        interactor.arr1 = context.arr1
        interactor.arr2 = context.arr2
        return InputContactContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: InputContactModuleInput, router: InputContactRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct InputContactContext {
	weak var moduleOutput: InputContactModuleOutput?
    var arr1 = [RentPrice]()
    var arr2 = [BuyPrice]()
}
