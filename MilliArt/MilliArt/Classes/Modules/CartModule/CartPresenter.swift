//
//  CartPresenter.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import Foundation

final class CartPresenter {
	weak var view: CartViewInput?
    weak var moduleOutput: CartModuleOutput?

	private let router: CartRouterInput
	private let interactor: CartInteractorInput

    init(router: CartRouterInput, interactor: CartInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension CartPresenter: CartModuleInput {
}

extension CartPresenter: CartViewOutput {
}

extension CartPresenter: CartInteractorOutput {
}
