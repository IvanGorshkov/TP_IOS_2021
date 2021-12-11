//
//  AuthorProtocols.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 05.12.2021.
//  
//

import Foundation

protocol AuthorModuleInput {
	var moduleOutput: AuthorModuleOutput? { get }
    var authorId: Int? { get set }
}

protocol AuthorModuleOutput: AnyObject {
}

protocol AuthorViewInput: AnyObject {
    func reloadData()
    func setAuthorHeader(author: FullAuthor)
}

protocol AuthorViewOutput: AnyObject {
    func viewDidLoad()
    func getCell(at index: Int) -> CellIdentifiable?
    func getCountCells() -> Int
    func getTitle() -> String
    func getCellIdentifier(at index: Int) -> String
    func itemSelected(id: Int)
    func changeSegament(index: Int)
    func sendMail()
    func openAbout()
}

protocol AuthorInteractorInput: AnyObject {
    func changeType(with id: Int, type: ProductAvalible)
    func loadData(with id: Int)
    func receiveId(with index: Int) -> Int
    func getMailInfo() -> Mail
    func getFullAuthor() -> FullAuthor?
}

protocol AuthorInteractorOutput: AnyObject {
    func receiveData(data: [VerticalPaintsModel])
    func receiveAuthor(author: FullAuthor)
}

protocol AuthorRouterInput: AnyObject {
    func itemSelected(with view: AuthorViewInput?, and id: Int)
    func openMail(with view: AuthorViewInput?, info: Mail)
    func openAbout(with view: AuthorViewInput?, author: FullAuthor?)
}
