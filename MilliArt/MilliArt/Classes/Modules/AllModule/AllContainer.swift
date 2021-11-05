//
//  AllContainer.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 05.11.2021.
//  
//

import UIKit

enum SelectAll {
    case allCompilations
    case allAuthors
}
protocol Creator {
    func factoryRouter() -> AllRouterInput
    func factoryInteractor() -> AllInteractorInput
}

class CompilationsCreator: Creator {
    func factoryRouter() -> AllRouterInput {
        return AllCompilationsRouter()
    }
    
    func factoryInteractor() -> AllInteractorInput {
        return AllCompilationsInteractor()
    }
}

class AuthorsCreator: Creator {
    func factoryRouter() -> AllRouterInput {
        return AllAuthorsRouter()
    }
    
    func factoryInteractor() -> AllInteractorInput {
        return AllAuthorsInteractor()
    }
}

class AllFactoryClient {
    static func getCreator(creator: SelectAll) -> Creator {
        switch creator {
            case .allAuthors:
                return AuthorsCreator()
            case .allCompilations:
                return CompilationsCreator()
        }
    }
}

final class AllContainer {
    let input: AllModuleInput
	let viewController: UIViewController
	private(set) weak var router: AllRouterInput!
    
	class func assemble(with context: AllContext) -> AllContainer {
        let creator = AllFactoryClient.getCreator(creator: context.caseAll)
        let router = creator.factoryRouter()
        let interactor = creator.factoryInteractor()
        let presenter = AllPresenter(router: router, interactor: interactor)
		let viewController = AllViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return AllContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: AllModuleInput, router: AllRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct AllContext {
	weak var moduleOutput: AllModuleOutput?
    var caseAll: SelectAll
}
