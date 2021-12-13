//
//  AuthorPresenter.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 05.12.2021.
//  
//

import Foundation

final class AuthorPresenter {
	weak var view: AuthorViewInput?
    weak var moduleOutput: AuthorModuleOutput?
    private var viewModel: VCollectionViewModel?
    var authorId: Int?
	private let router: AuthorRouterInput
	private let interactor: AuthorInteractorInput

    init(router: AuthorRouterInput, interactor: AuthorInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension AuthorPresenter: AuthorModuleInput {
}

extension AuthorPresenter: AuthorViewOutput {
    func openAbout() {
        router.openAbout(with: view, author: interactor.getFullAuthor())
    }
    
    func sendMail() {
        router.openMail(with: view, info: interactor.getMailInfo())
    }
    
    func changeSegament(index: Int) {
        interactor.changeType(with: authorId ?? 0, type: ProductAvalible(rawValue: index))
    }
    
    func itemSelected(id: Int) {
        self.router.itemSelected(with: self.view, and: interactor.receiveId(with: id))
    }
    
    func getCellIdentifier(at index: Int) -> String {
        return viewModel?.array[index].cellIdentifier ?? ""
    }
    
    func viewDidLoad() {
        interactor.loadData(with: authorId ?? 0)
    }
    
    func getCell(at index: Int) -> CellIdentifiable? {
        return viewModel?.array[index]
    }
    
    func getCountCells() -> Int {
        return viewModel?.array.count ?? 0
    }
    
    func getTitle() -> String {
        return ""
    }
}

extension AuthorPresenter: AuthorInteractorOutput {
    func receiveAuthor(author: FullAuthor) {
        view?.setAuthorHeader(author: author)
    }
    
    func receiveData(data: [VerticalPaintsModel]) {
        viewModel = VCollectionViewModel(newPaints: data)
        view?.reloadData()
    }
}
