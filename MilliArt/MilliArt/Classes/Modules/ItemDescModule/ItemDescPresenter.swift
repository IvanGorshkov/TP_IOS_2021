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
    func viewDidLoad() {
        view?.updateForSections([ItemDescSectionModel(ItemDescModel(name: "На гребне волны", pictures: ["favicon"], amount: 0, rent: 0, description: "На гребне волны", specifications: []))])
    }
    
}

extension ItemDescPresenter: ItemDescInteractorOutput {
}
