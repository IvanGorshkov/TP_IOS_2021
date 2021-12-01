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
    var expand: ExpandeDescription { get }
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

protocol ServiceCartModelInput: AnyObject {
    func loadItemsByIds(with ids: [Int])
}

protocol ServiceCartModelOutput: AnyObject {
    func itemDidLoad(baseCarts: [BaseCart])
    func didFail(with error: Error)
}
