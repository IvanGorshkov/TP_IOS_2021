//
//  ItemDescPresenter.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import Foundation

final class ItemDescPresenter {
	weak var view: ItemDescViewInput?
    weak var moduleOutput: ItemDescModuleOutput?

	private let router: ItemDescRouterInput
	private let interactor: ItemDescInteractorInput
    
    init(router: ItemDescRouterInput, interactor: ItemDescInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension ItemDescPresenter: ItemDescModuleInput {
}

extension ItemDescPresenter: ItemDescViewOutput {
    func changeMonthCount(value: Int) {
        interactor.changeMonthCount(value: value)
    }
    
    func viewDidLoad() {
        interactor.loadItemById(with: 1)
    }
    
}

extension ItemDescPresenter: ItemDescInteractorOutput {
    func updateRentPrice(itemDesc: ItemDescModel) {
        view?.updateRentPrice(ItemDescSectionModel(itemDesc))
    }
    
    func itemDidLoad(itemDesc: ItemDescModel) {
        view?.updateForSections(ItemDescSectionModel(itemDesc))
    }
}
