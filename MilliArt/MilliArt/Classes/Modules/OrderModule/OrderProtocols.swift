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
    func getCell(section: Int, row: Int) -> CellIdentifiable?
    func getSection(section: Int) -> CellIdentifiable?
    func getCellIdentifier(section: Int, row: Int) -> String
    func getSectionIdentifier(section: Int) -> String
    func getCountCells(section: Int) -> Int
    func getCountSection() -> Int
    func isExpandable(section: Int) -> Bool
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
