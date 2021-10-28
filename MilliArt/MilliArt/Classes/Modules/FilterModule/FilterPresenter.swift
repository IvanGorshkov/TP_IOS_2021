//
//  FilterPresenter.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import Foundation

final class FilterPresenter {
	weak var view: FilterViewInput?
    weak var moduleOutput: FilterModuleOutput?

	private let router: FilterRouterInput
	private let interactor: FilterInteractorInput

    init(router: FilterRouterInput, interactor: FilterInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension FilterPresenter: FilterModuleInput {
}

extension FilterPresenter: FilterViewOutput {
}

extension FilterPresenter: FilterInteractorOutput {
}
