//
//  AREditContainer.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 01.11.2021.
//  
//

import UIKit

final class AREditContainer {
    let input: AREditModuleInput
	let viewController: UIViewController
	private(set) weak var router: AREditRouterInput!

	class func assemble(with context: AREditContext) -> AREditContainer {
        let router = AREditRouter()
        let interactor = AREditInteractor()
        let presenter = AREditPresenter(router: router, interactor: interactor)
		let viewController = AREditViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput
        presenter.arModel = context.arModel

		interactor.output = presenter

        return AREditContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: AREditModuleInput, router: AREditRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct AREditContext {
	weak var moduleOutput: AREditModuleOutput?
    var arModel: PaintingARModel
}
