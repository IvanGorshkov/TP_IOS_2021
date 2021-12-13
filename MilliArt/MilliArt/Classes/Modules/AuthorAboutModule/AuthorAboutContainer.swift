//
//  AuthorAboutContainer.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 12.12.2021.
//  
//

import UIKit

final class AuthorAboutContainer {
    let input: AuthorAboutModuleInput
	let viewController: UIViewController
	private(set) weak var router: AuthorAboutRouterInput!

	class func assemble(with context: AuthorAboutContext) -> AuthorAboutContainer {
        let router = AuthorAboutRouter()
        let interactor = AuthorAboutInteractor()
        let presenter = AuthorAboutPresenter(router: router, interactor: interactor)
		let viewController = AuthorAboutViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput
		interactor.output = presenter
        interactor.author = context.author

        return AuthorAboutContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: AuthorAboutModuleInput, router: AuthorAboutRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct AuthorAboutContext {
	weak var moduleOutput: AuthorAboutModuleOutput?
    var author: FullAuthor?
}
