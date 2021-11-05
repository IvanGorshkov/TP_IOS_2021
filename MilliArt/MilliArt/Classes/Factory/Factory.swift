//
//  Factory.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 05.11.2021.
//

import Foundation

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
