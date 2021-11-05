//
//  MainProtocols.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import Foundation

protocol MainModuleInput {
	var moduleOutput: MainModuleOutput? { get }
}

protocol MainModuleOutput: AnyObject {
}

protocol MainViewInput: AnyObject {
}

protocol TableViewCellOutput: AnyObject {
    func clickAllCompilation()
    func clickAllAuthor()
}

protocol MainTableViewCellDescription: AnyObject {
    var delegate: TableViewCellOutput? { get set }
}

protocol MainViewOutput: AnyObject {
    func itemSelected()
    func viewDidLoad()
    func getCellHeight(at index: Int) -> Float
    func getCell(at index: Int) -> CellIdentifiable?
    func getCellIdentifier(at index: Int) -> String
    func getCountCells() -> Int
    var  sectionDelegate: TableViewCellOutput? { get set }
}

protocol MainInteractorInput: AnyObject {
    func loadData()
}

protocol MainInteractorOutput: AnyObject {
    func receiveData(newPaints: [VerticalPaintsModel], compilations:[CompilationModel], authors:[AuthorModel])
}

protocol MainRouterInput: AnyObject {
    func itemSelected(with view: MainViewInput?)
}
