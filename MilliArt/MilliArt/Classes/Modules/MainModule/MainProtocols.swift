//
//  MainProtocols.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import Firebase

protocol MainModuleInput {
	var moduleOutput: MainModuleOutput? { get }
}

protocol MainModuleOutput: AnyObject {
}

protocol MainViewInput: AnyObject {
    func reloadData()
}

protocol TableViewCellOutput: AnyObject {
    func clickAllCompilation()
    func clickAllAuthor()
    func clickOnAuthor(with id: Int)
    func clickOnCompilation(with id: Int)
    func clickOnArt(with id: Int)
}

protocol MainTableViewCellDescription: AnyObject {
    var delegate: TableViewCellOutput? { get set }
}

protocol MainViewOutput: AnyObject {
    func clickOnArt(with id: Int)
    func clickOnCompilation(with id: Int)
    func clickOnAuthor(with id: Int)
    func viewDidLoad()
    func getCellHeight(at index: Int) -> Float
    func getCell(at index: Int) -> CellIdentifiable?
    func getCellIdentifier(at index: Int) -> String
    func getCountCells() -> Int
    var  sectionDelegate: TableViewCellOutput? { get set }
    func goToAllCompilation()
    func goToAllAuthor()
}

protocol MainInteractorInput: AnyObject {
    func loadData()
    func receiveId(with index: Int) -> Int
    func receiveCompilationTitle(with index: Int) -> String
}

protocol MainInteractorOutput: AnyObject {
    func receiveData(newPaints: [VerticalPaintsModel], compilations: [CompilationModel], authors: [AuthorModel])
}

protocol MainRouterInput: AnyObject {
    func itemSelected(with view: MainViewInput?, and id: Int)
    func compilationSelected(with view: MainViewInput?, title: String, and id: Int)
    func goToAllCompilation(with view: MainViewInput?)
    func goToAllAuthor(with view: MainViewInput?)
}

protocol NetServiceInput: AnyObject {
    func requestToNetService()
    func addSort(param: String, desc: Bool)
    func addLimit()
    func reset()
    var itemLimit: Int { get set }
    var productConverter: ConverterDescription? { get set }
}

protocol NetServiceWithIdInput: AnyObject {
    func requestToNetService(with id: Int?)
    var itemLimit: Int { get set }
    var productConverter: ConverterDescription? { get set }
}

protocol NetServiceOutput: AnyObject {
    func receiveFromService<T>(data: [T])
    func didFail(with error: Error)
}

protocol ConverterDescription: AnyObject {
    func product<T: Any>(from document: DocumentSnapshot) -> T?
}
