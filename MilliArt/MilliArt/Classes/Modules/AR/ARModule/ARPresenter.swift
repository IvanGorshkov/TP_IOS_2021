//
//  ARPresenter.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 31.10.2021.
//  
//

import Foundation

final class ARPresenter {
	weak var view: ARViewInput?
    weak var moduleOutput: ARModuleOutput?

    var arViewModel: ARViewModelDescription?
	private let router: ARRouterInput
	private let interactor: ARInteractorInput

    init(router: ARRouterInput, interactor: ARInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension ARPresenter: ARModuleInput {
}

extension ARPresenter: AREditModuleOutput {
    func dontSave() {
        view?.runSession()
    }

    func returnModel(model: ARViewModelDescription) {
        self.arViewModel = model
        view?.runSession()
        view?.loadModel(arModel: arViewModel)
    }
}

extension ARPresenter: ARViewOutput {
    func getARViewModel() -> ARViewModelDescription? {
        guard let arViewModel = arViewModel else { return nil }
        return arViewModel
    }

    func openEditFrame() {
        router.goToAR(from: view, arModel: arViewModel, presenter: self)
    }

    func viewDidLoad() {
        view?.loadModel(arModel: arViewModel)
    }
}

extension ARPresenter: ARInteractorOutput {
}
