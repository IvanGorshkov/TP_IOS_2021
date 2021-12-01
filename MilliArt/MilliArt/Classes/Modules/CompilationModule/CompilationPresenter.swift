//
//  CompilationPresenter.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 01.12.2021.
//  
//

import Foundation

final class CompilationPresenter {
	weak var view: CompilationViewInput?
    weak var moduleOutput: CompilationModuleOutput?
    var compilationId: Int?
	private let router: CompilationRouterInput
	private let interactor: CompilationInteractorInput
    var title: String?
    
    private var viewModel: VCollectionViewModel?

    init(router: CompilationRouterInput, interactor: CompilationInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension CompilationPresenter: CompilationModuleInput {
}

extension CompilationPresenter: CompilationViewOutput {
    func itemSelected(id: Int) {
        self.router.itemSelected(with: self.view, and: interactor.receiveId(with: id))
    }
    
    func getCellIdentifier(at index: Int) -> String {
        return viewModel?.array[index].cellIdentifier ?? ""
    }
    
    func viewDidLoad() {
        interactor.loadData(with: compilationId ?? 0)
    }
    
    func getCell(at index: Int) -> CellIdentifiable? {
        return viewModel?.array[index]
    }
    
    func getCountCells() -> Int {
        return viewModel?.array.count ?? 0
    }
    
    func getTitle() -> String {
        return self.title ?? ""
    }
}

extension CompilationPresenter: CompilationInteractorOutput {
    func receiveData(data: [VerticalPaintsModel]) {
        viewModel = VCollectionViewModel(newPaints: data)
        view?.reloadData()
    }
}
