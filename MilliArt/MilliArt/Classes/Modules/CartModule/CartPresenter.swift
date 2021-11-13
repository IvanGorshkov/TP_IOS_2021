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
        var arr = [CartSectionViewModel]()
        if !rentArray.isEmpty {
            arr.append(CartSectionViewModel(rows: rentArray.map({ rent in
                return RentViewModel(model: rent) { id in
                    self.interactor.deleteRent(with: id)
                }
            }), title: "Аренда"))
        }
        if !buyArray.isEmpty {
            arr.append(CartSectionViewModel(rows: buyArray.map({ buy in
                return BuyViewModel(model: buy) { id in
                    self.interactor.deleteBuy(with: id)
                }
            }), title: "Покупка"))
        }
        if !buyArray.isEmpty || !rentArray.isEmpty {
            arr.append(CartSectionViewModel(rows: [TotalCartViewModel(rentArray: rentArray, buyArray: buyArray)]))
        }
        
        expandP.model = arr
        view?.loadData()
    }
}
