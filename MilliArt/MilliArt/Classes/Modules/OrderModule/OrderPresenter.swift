//
//  OrderPresenter.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 12.11.2021.
//  
//

import Foundation

final class OrderPresenter {
	weak var view: OrderViewInput?
    weak var moduleOutput: OrderModuleOutput?
    
	private let router: OrderRouterInput
	private let interactor: OrderInteractorInput
    internal var expandP: ExpandeDescription

    init(router: OrderRouterInput, interactor: OrderInteractorInput) {
        self.router = router
        self.interactor = interactor
        expandP = ExpandePresenter()
    }
}

extension OrderPresenter: OrderModuleInput {
}

extension OrderPresenter: OrderViewOutput {
    func getOrderId() -> Int {
        return interactor.numberOrder
    }
    
    var expand: ExpandeDescription {
        return expandP
    }
    
    func viewDidLoad() {
        interactor.getCartItems()
    }
}

extension OrderPresenter: OrderInteractorOutput {
    func getCartItems(rentArray: [RentPrice], buyArray: [BuyPrice]) {
        let constructor = ConstructorCartSectionViewModel.init(rentArray: rentArray, buyArray: buyArray, actionRent: nil, actionBuy: nil)
        expandP.model = constructor.modelArray
        view?.loadData()
    }
}
