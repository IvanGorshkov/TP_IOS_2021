//
//  AuthorAboutPresenter.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 12.12.2021.
//  
//

import Foundation

final class AuthorAboutPresenter {
	weak var view: AuthorAboutViewInput?
    weak var moduleOutput: AuthorAboutModuleOutput?

	private let router: AuthorAboutRouterInput
	private let interactor: AuthorAboutInteractorInput
    var author: FullAuthor?

    init(router: AuthorAboutRouterInput, interactor: AuthorAboutInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension AuthorAboutPresenter: AuthorAboutModuleInput {
}

extension AuthorAboutPresenter: AuthorAboutViewOutput {
    func getImage() -> String {
        return interactor.getImage()
    }
    
    func getFullName() -> String {
        return interactor.getFullName()
    }
    
    func getText(index: Int) -> String {
        return interactor.getText(index: index)
    }
}

extension AuthorAboutPresenter: AuthorAboutInteractorOutput {
}
