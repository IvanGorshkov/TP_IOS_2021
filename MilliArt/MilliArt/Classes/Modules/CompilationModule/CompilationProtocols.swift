//
//  CompilationProtocols.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 01.12.2021.
//  
//

import Foundation

protocol CompilationModuleInput {
	var moduleOutput: CompilationModuleOutput? { get }
    var compilationId: Int? { get set }
    var title: String? { get set }
}

protocol CompilationModuleOutput: AnyObject {
}

protocol CompilationViewInput: AnyObject {
    func reloadData()
}

protocol CompilationViewOutput: AnyObject {
    func viewDidLoad()
    func getCell(at index: Int) -> CellIdentifiable?
    func getCountCells() -> Int
    func getTitle() -> String
    func getCellIdentifier(at index: Int) -> String
    func itemSelected(id: Int)
}

protocol CompilationInteractorInput: AnyObject {
    func loadData(with id: Int)
    func receiveId(with index: Int) -> Int
}

protocol CompilationInteractorOutput: AnyObject {
    func receiveData(data: [VerticalPaintsModel])
}

protocol CompilationRouterInput: AnyObject {
    func itemSelected(with view: CompilationViewInput?, and id: Int)
}
