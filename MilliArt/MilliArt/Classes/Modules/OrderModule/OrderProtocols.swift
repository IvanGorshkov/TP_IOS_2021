//
//  OrderProtocols.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 12.11.2021.
//  
//

import Foundation

protocol OrderModuleInput {
	var moduleOutput: OrderModuleOutput? { get }
}

protocol OrderModuleOutput: AnyObject {
}

protocol OrderViewInput: AnyObject {
    func loadData()
}

protocol OrderViewOutput: AnyObject {
    func viewDidLoad()
    var expand: ExpandeDescription { get }
}

protocol OrderInteractorInput: AnyObject {
    var numberOrder: Int { get set }
    func getCartItems()
}

protocol OrderInteractorOutput: AnyObject {
    func getCartItems(rentArray: [RentPrice], buyArray: [BuyPrice])
}

protocol OrderRouterInput: AnyObject {
}
