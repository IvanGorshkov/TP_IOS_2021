//
//  Factory.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 05.11.2021.
//

import Foundation

protocol CreatorForAll {
    func factoryRouter() -> AllRouterInput
    func factoryInteractor() -> AllInteractorInput
}

class CompilationsCreatorForAll: CreatorForAll {
    func factoryRouter() -> AllRouterInput {
        return AllCompilationsRouter()
    }

    func factoryInteractor() -> AllInteractorInput {
        return AllCompilationsInteractor()
    }
}

class AuthorsCreatorForAll: CreatorForAll {
    func factoryRouter() -> AllRouterInput {
        return AllAuthorsRouter()
    }

    func factoryInteractor() -> AllInteractorInput {
        return AllAuthorsInteractor()
    }
}
