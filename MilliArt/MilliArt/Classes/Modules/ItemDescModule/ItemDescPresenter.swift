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
        view?.updateForSections([ItemDescSectionModel(ItemDescModel(name: "На гребне волны", pictures: ["pic1"], amount: 34000, rent: 1200, description: "На гребне волны, На гребне волны, На гребне волны, На гребне волны. На гребне волны, На гребне волны, На гребне волны, На гребне волны\nНа гребне волны, На гребне волны", specifications: [
            Specifications(title: "Автор", specification: "Анастасия Колесниченко"),
            Specifications(title: "Размер", specification: "51 x 34 см"),
            Specifications(title: "Категория", specification: "Фотография"),
            Specifications(title: "Гамма", specification: "Оранжевый"),
            Specifications(title: "Тематика", specification: "Натюрморт"),
            Specifications(title: "Формат", specification: "Вертикальный"),
        ]))])
    }
    
}

extension ItemDescPresenter: ItemDescInteractorOutput {
}
