//
//  MainProtocols.swift
//  MilliArt
//
//  Created by Alekhin Sergey on 28.10.2021.
//  
//

import Foundation

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
    func clickOnArt(with id: Int)
}

protocol MainTableViewCellDescription: AnyObject {
    var delegate: TableViewCellOutput? { get set }
}

protocol MainViewOutput: AnyObject {
    func clickOnArt(with id: Int)
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
}

protocol MainInteractorOutput: AnyObject {
    func receiveData(newPaints: [VerticalPaintsModel], compilations: [CompilationModel], authors: [AuthorModel])
}

protocol MainRouterInput: AnyObject {
    func itemSelected(with view: MainViewInput?, and id: Int)
    func goToAllCompilation(with view: MainViewInput?)
    func goToAllAuthor(with view: MainViewInput?)
}

protocol NewPaintingsServiceInput: AnyObject {
    func getNewPaining()
}

protocol NewPaintingsServiceOutput: AnyObject {
    func receivenewPaints(newPaints: [VerticalPaintsModel])
    func didFail(with error: Error)
}

protocol ActualCollectionServiceOutput: AnyObject {
    func receivenewPaints(newCompilations: [CompilationModel])
    func didFail(with error: Error)
}

protocol ActualAuthorServiceOutput: AnyObject {
    func receivenewPaints(authors: [AuthorModel])
    func didFail(with error: Error)
}
