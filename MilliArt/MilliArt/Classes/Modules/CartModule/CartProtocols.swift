//
//  CartProtocols.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import Foundation

protocol CartModuleInput {
	var moduleOutput: CartModuleOutput? { get }
}

protocol CartModuleOutput: AnyObject {
}

protocol CartViewInput: AnyObject {
    func loadData()
}

protocol CartViewCellOutput: AnyObject {
    func deleteRent(with id: Int)
    func deleteBuy(with id: Int)
}

protocol CartViewOutput: AnyObject {
    func viewDidLoad()
    func goToCheckout()
    func isBasketEmpty() -> Bool
    func getCell(section: Int, row: Int) -> CellIdentifiable?
    func getSection(section: Int) -> CellIdentifiable?
    func getCellIdentifier(section: Int, row: Int) -> String
    func getSectionIdentifier(section: Int) -> String
    func getCountCells(section: Int) -> Int
    func getCountSection() -> Int
    func isExpandable(section: Int) -> Bool
}

protocol CartInteractorInput: AnyObject {
    func getCartItems()
    func deleteRent(with id: Int)
    func deleteBuy(with id: Int)
    func getArrays() -> (rentArray: [RentPrice], buyArray: [BuyPrice])
}

protocol CartInteractorOutput: AnyObject {
    func getCartItems(rentArray: [RentPrice], buyArray: [BuyPrice])
}

protocol CartRouterInput: AnyObject {
    func goToCheckout(from vc: CartViewInput?, data: (rentArray: [RentPrice], buyArray: [BuyPrice]))
}
