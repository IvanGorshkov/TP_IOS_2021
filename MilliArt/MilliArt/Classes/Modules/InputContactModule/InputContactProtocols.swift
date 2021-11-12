//
//  InputContactModuleProtocols.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 11.11.2021.
//  
//

import Foundation

protocol InputContactModuleInput {
	var moduleOutput: InputContactModuleOutput? { get }
}

protocol InputContactModuleOutput: AnyObject {
}

protocol InputContactViewInput: AnyObject {
    func updateTableView()
}

protocol InputContactViewOutput: AnyObject {
    func viewDidLoad()
    func checkout(with data: [CheckoutDataModel])
    func getCellHeight(at index: Int) -> Float
    func getCell(at index: Int) -> CellIdentifiable?
    func getCellIdentifier(at index: Int) -> String
    func getCountCells() -> Int
}

protocol InputContactInteractorInput: AnyObject {
    func getInputs() -> [InputCheckoutModel]
    func getArrays() -> (rentArray: [RentPrice], buyArray: [BuyPrice])
    func checkout(with data: [CheckoutDataModel])
}

protocol InputContactInteractorOutput: AnyObject {
    func resualtCheckout(error: Error?, orderNumber: Int?)
}

protocol InputContactRouterInput: AnyObject {
    func goToOrder(from vc: InputContactViewInput?, orderNumber: Int)
}

protocol ValidationCell: AnyObject {
    var verification: VerificationProtocol? { get }
    func validateCell() -> Bool
}

protocol InputCellOutput: AnyObject {
    func getDataInput() -> CheckoutDataModel?
}
