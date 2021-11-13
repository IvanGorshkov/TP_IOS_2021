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
    var expand: ExpandeDescription {
        return expandP
    }
    
    func viewDidLoad() {
        interactor.getCartItems()
    }
}

extension OrderPresenter: OrderInteractorOutput {
    func getCartItems(rentArray: [RentPrice], buyArray: [BuyPrice]) {
        var arr = [CartSectionViewModel]()
        if !rentArray.isEmpty {
            arr.append(CartSectionViewModel(rows: rentArray.map({ rent in
                return RentViewModel(model: rent, delete: nil)
            }), title: "Аренда"))
        }
        if !buyArray.isEmpty {
            arr.append(CartSectionViewModel(rows: buyArray.map({ buy in
                return BuyViewModel(model: buy, delete: nil)
            }), title: "Покупка"))
        }
        expandP.model = arr
        view?.loadData()
    }
}
