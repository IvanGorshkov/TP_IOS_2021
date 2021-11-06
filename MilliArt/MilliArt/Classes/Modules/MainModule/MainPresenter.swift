//
//  MainPresenter.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import Foundation

final class MainPresenter {
	weak var view: MainViewInput?
    weak var moduleOutput: MainModuleOutput?

	private let router: MainRouterInput
	private let interactor: MainInteractorInput
    private var mainSectionViewModel: MainSectionViewModel?

    init(router: MainRouterInput, interactor: MainInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension MainPresenter: MainModuleInput {
}

extension MainPresenter: MainViewOutput {
    func goToAllAuthor() {
        router.goToAllAuthor(with: view)
    }

    func goToAllCompilation() {
        router.goToAllCompilation(with: view)
    }

    func viewDidLoad() {
        interactor.loadData()
    }

    func getCellHeight(at index: Int) -> Float {
        guard let mainSectionViewModel = mainSectionViewModel else { return -1 }
        return mainSectionViewModel.rows[index].cellHeight
    }

    func getCell(at index: Int) -> CellIdentifiable? {
        guard let mainSectionViewModel = mainSectionViewModel else { return nil }
        return mainSectionViewModel.rows[index]
    }

    func getCellIdentifier(at index: Int) -> String {
        guard let mainSectionViewModel = mainSectionViewModel else { return "" }
        return mainSectionViewModel.rows[index].cellIdentifier
    }

    func getCountCells() -> Int {
        guard let mainSectionViewModel = mainSectionViewModel else { return 0 }
        return mainSectionViewModel.rows.count
    }

    var sectionDelegate: TableViewCellOutput? {
        get {
            guard let mainSectionViewModel = mainSectionViewModel else { return nil }
            return mainSectionViewModel.actions
        }
        set {
            mainSectionViewModel?.actions = newValue
        }
    }

    func itemSelected() {
        router.itemSelected(with: view)
    }
}

extension MainPresenter: MainInteractorOutput {
    func receiveData(newPaints: [VerticalPaintsModel], compilations: [CompilationModel], authors: [AuthorModel]) {
        mainSectionViewModel = MainSectionViewModel(newPaints: newPaints, compilations: compilations, authors: authors)
    }
}
