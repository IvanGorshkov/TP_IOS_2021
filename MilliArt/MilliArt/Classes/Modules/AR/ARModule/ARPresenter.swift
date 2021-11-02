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

    var arViewModel: ARViewModel?
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
    func returnModel(model: ARViewModel) {
        self.arViewModel = model
        view?.loadModel(arModel: arViewModel)
    }
}

extension ARPresenter: ARViewOutput {
    func openEditFrame() {
        router.goToAR(from: view, arModel: arViewModel, presenter: self)
    }
    
    func viewDidLoad() {
        view?.loadModel(arModel: arViewModel)
    }
    
}

extension ARPresenter: ARInteractorOutput {
}
