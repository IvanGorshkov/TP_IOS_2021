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
    private var itemDescModel: ItemDescModel?
    
    init(router: ItemDescRouterInput, interactor: ItemDescInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension ItemDescPresenter: ItemDescModuleInput {
}

extension ItemDescPresenter: ItemDescViewOutput {
    func viewDidLoad() {
        interactor.loadItemById(with: 1)
    }
    
}

extension ItemDescPresenter: ItemDescInteractorOutput {
    func itemDidLoad(itemDesc: ItemDescModel) {
        self.itemDescModel = itemDesc
        guard let itemDescModel =  self.itemDescModel else { return }
        view?.updateForSections(ItemDescSectionModel(itemDescModel))
    }
}
