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
    internal var expandP: ExpandeDescription
    init(router: CartRouterInput, interactor: CartInteractorInput) {
        self.router = router
        self.interactor = interactor
        expandP = ExpandePresenter()
    }
}

extension CartPresenter: CartModuleInput {
}

extension CartPresenter: CartViewOutput {
    var expand: ExpandeDescription {
        return expandP
    }
    
    func goToCheckout() {
        router.goToCheckout(from: view, data: interactor.getArrays())
    }
    
    func viewDidLoad() {
        interactor.getCartItems()
    }
}

extension CartPresenter: CartInteractorOutput {
    func getCartItems(rentArray: [RentPrice], buyArray: [BuyPrice]) {
        let constructor = ConstructorCartSectionViewModel(rentArray: rentArray, buyArray: buyArray) { [weak self] id in
            self?.interactor.deleteRent(with: id)
        } actionBuy: { [weak self] id in
            self?.interactor.deleteBuy(with: id)
        }

        expandP.model = constructor.modelArray
        view?.loadData()
    }
}
