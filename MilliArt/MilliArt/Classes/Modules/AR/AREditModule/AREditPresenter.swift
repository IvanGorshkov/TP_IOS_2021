//
//  AREditPresenter.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 01.11.2021.
//  
//

import Foundation

final class AREditPresenter {
	weak var view: AREditViewInput?
    weak var moduleOutput: AREditModuleOutput?

    var arModel: PaintingARModel?
	private let router: AREditRouterInput
	private let interactor: AREditInteractorInput

    init(router: AREditRouterInput, interactor: AREditInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension AREditPresenter: AREditModuleInput {
}

extension AREditPresenter: AREditViewOutput {
    func viewDidDisappear() {
        guard let arModel = arModel else { return }
        moduleOutput?.returnModel(model: arModel)
    }
    
    func viewDidLoad() {
        arModel?.material = "Gold"
    }
    
}

extension AREditPresenter: AREditInteractorOutput {
}
