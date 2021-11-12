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
    private var arr = [CartSectionViewModel]()

	private let router: OrderRouterInput
	private let interactor: OrderInteractorInput

    init(router: OrderRouterInput, interactor: OrderInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension OrderPresenter: OrderModuleInput {
}

extension OrderPresenter: OrderViewOutput {
    func isExpandable(section: Int) -> Bool {
        return true
    }
    
    func viewDidLoad() {
        interactor.getCartItems()
    }
    
    func getCell(section: Int, row: Int) -> CellIdentifiable? {
        if arr[section].isExpandable == true {
            return arr[section].rows[row - 1]
        }
        return arr[section].rows[row]
    }
    
    func getSection(section: Int) -> CellIdentifiable? {
        return arr[section]
    }
    
    func getCellIdentifier(section: Int, row: Int) -> String {
        if arr[section].isExpandable == true {
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
        if arr[section].isExpandable == true {
            return arr[section].rows.count + 1
        }
        return arr[section].rows.count
    }
    
    func getCountSection() -> Int {
        return arr.count
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
        self.arr = arr
        view?.loadData()
    }
}
