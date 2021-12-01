//
//  CompilationContainer.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 01.12.2021.
//  
//

import UIKit

final class CompilationContainer {
    let input: CompilationModuleInput
	let viewController: UIViewController
	private(set) weak var router: CompilationRouterInput!

	class func assemble(with context: CompilationContext) -> CompilationContainer {
        let router = CompilationRouter()
        let interactor = CompilationInteractor()
        let presenter = CompilationPresenter(router: router, interactor: interactor)
		let viewController = CompilationViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput
        presenter.compilationId = context.id
        presenter.title = context.title
		interactor.output = presenter

        return CompilationContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: CompilationModuleInput, router: CompilationRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct CompilationContext {
	weak var moduleOutput: CompilationModuleOutput?
    var id: Int?
    var title: String?
}
