//
//  ARContainer.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 31.10.2021.
//  
//

import UIKit

final class ARContainer {
    let input: ARModuleInput
	let viewController: UIViewController
	private(set) weak var router: ARRouterInput!

	class func assemble(with context: ARContext) -> ARContainer {
        let router = ARRouter()
        let interactor = ARInteractor()
        let presenter = ARPresenter(router: router, interactor: interactor)
		let viewController = ARViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput
        presenter.arViewModel = ARViewModel(model: context.arModel)
		interactor.output = presenter

        return ARContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: ARModuleInput, router: ARRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct ARContext {
	weak var moduleOutput: ARModuleOutput?
    var arModel: PaintingARModel
}
