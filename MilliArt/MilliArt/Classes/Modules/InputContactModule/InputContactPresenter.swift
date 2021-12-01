//
//  InputContactModulePresenter.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 11.11.2021.
//  
//

import Foundation

final class InputContactPresenter {
	weak var view: InputContactViewInput?
    weak var moduleOutput: InputContactModuleOutput?

	private let router: InputContactRouterInput
	private let interactor: InputContactInteractorInput
    private var viewModel: SectionRowsRepresentable?
    
    init(router: InputContactRouterInput, interactor: InputContactInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension InputContactPresenter: InputContactModuleInput {
}

extension InputContactPresenter: InputContactViewOutput {
    func checkout(with data: [CheckoutDataModel]) {
        interactor.checkout(with: data)
    }
    
    func viewDidLoad() {
        self.viewModel = InputSectionModel(inputs: interactor.getInputs(), data: interactor.getArrays())
        view?.updateTableView()
    }
    
    func getCellHeight(at index: Int) -> Float {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.rows[index].cellHeight
    }
    
    func getCell(at index: Int) -> CellIdentifiable? {
        return viewModel?.rows[index]
    }
    
    func getCellIdentifier(at index: Int) -> String {
        guard let viewModel = viewModel else { return "" }
        return viewModel.rows[index].cellIdentifier
    }
    
    func getCountCells() -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.rows.count
    }
}

extension InputContactPresenter: InputContactInteractorOutput {
    func resualtCheckout(error: Error?, orderNumber: Int?) {
        if error != nil {
        } else {
            guard let orderNumber = orderNumber else { return }
            router.goToOrder(from: view, orderNumber: orderNumber)
        }
    }
}
