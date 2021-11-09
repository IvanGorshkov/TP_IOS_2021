//
//  AllProtocols.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 05.11.2021.
//  
//

import Foundation

protocol AllModuleInput {
	var moduleOutput: AllModuleOutput? { get }
}

protocol AllModuleOutput: AnyObject {
}

protocol AllViewInput: AnyObject {
    func reloadData()
}

protocol AllViewOutput: AnyObject {
    func viewDidLoad()
    func getCell(at index: Int) -> CellIdentifiable?
    func getCountCells() -> Int
    func getTitle() -> String
}

protocol AllInteractorInput: AnyObject {
    func loadData()
    func getTitle() -> String
    var output: AllInteractorOutput? { get set }
}

protocol AllInteractorOutput: AnyObject {
    func receiveData(data: [HorizontalViewModel])
}

protocol AllRouterInput: AnyObject {
}
