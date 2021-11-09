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
    private var arr = [CartSectionViewModel]()

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
    func isExpandable(section: Int) -> Bool {
        if arr.isEmpty {
            return false
        }
        return arr[section].isExpandable
    }
    
    func viewDidLoad() {
        interactor.getCartItems()
    }
    
    func getCell(section: Int, row: Int) -> CellIdentifiable? {
        if section != 2 {
            return arr[section].rows[row - 1]
        }
        return arr[section].rows[row]
    }
    
    func getSection(section: Int) -> CellIdentifiable? {
        return arr[section]
    }
    
    func getCellIdentifier(section: Int, row: Int) -> String {
        if section != 2 {
            return arr[section].rows[row - 1].cellIdentifier
        }
        return arr[section].rows[row].cellIdentifier
    }
    
    func getSectionIdentifier(section: Int) -> String {
        return arr[section].cellIdentifier
    }
    
    func getCountCells(section: Int) -> Int {
        if arr.isEmpty {
            return 0
        }
        if section != 2 {
            return arr[section].rows.count + 1
        }
        return arr[section].rows.count
    }
    
    func getCountSection() -> Int {
        return arr.count
    }

    func isBasketEmpty() -> Bool {
        return arr.isEmpty
    }
}

extension CartPresenter: CartInteractorOutput {
    func getCartItems(rentArray: [RentPrice], buyArray: [BuyPrice]) {
        if !rentArray.isEmpty {
            arr.append(CartSectionViewModel(rows: rentArray.map({ rent in
                return RentViewModel(model: rent)
            }), title: "Аренда"))
        }
        if !buyArray.isEmpty {
            arr.append(CartSectionViewModel(rows: buyArray.map({ buy in
                return BuyViewModel(model: buy)
            }), title: "Покупка"))
        }
        if !buyArray.isEmpty || !rentArray.isEmpty {
        arr.append(CartSectionViewModel(rows: [TotalCartViewModel(rentArray: rentArray, buyArray: buyArray)]))
        }
        view?.loadData()
    }
}
