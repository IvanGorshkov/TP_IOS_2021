//
//  AuthorContainer.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 05.12.2021.
//  
//

import UIKit

final class AuthorContainer {
    let input: AuthorModuleInput
	let viewController: UIViewController
	private(set) weak var router: AuthorRouterInput!

	class func assemble(with context: AuthorContext) -> AuthorContainer {
        let router = AuthorRouter()
        let interactor = AuthorInteractor()
        let presenter = AuthorPresenter(router: router, interactor: interactor)
		let viewController = AuthorViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput
        presenter.authorId = context.id
        
		interactor.output = presenter

        return AuthorContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: AuthorModuleInput, router: AuthorRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct AuthorContext {
	weak var moduleOutput: AuthorModuleOutput?
    var id: Int?
}
