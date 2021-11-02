//
//  AREditPresenter.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 01.11.2021.
//  
//

import UIKit

final class AREditPresenter {
	weak var view: AREditViewInput?
    weak var moduleOutput: AREditModuleOutput?

    var arModel: ARViewModel?
    var modelArray:  [FrameViewModel] = []
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
    func setWAndRFrame(width: Float, raadius: Float) {
        arModel?.ARborderThickness = (CGFloat(width), CGFloat(width))
        arModel?.ARborderRounded = CGFloat(raadius)
    }
    
    func frameDidSelect(index: Int) {
        arModel?.ARmaterial = self.modelArray[index].colorFrame
        if self.modelArray[index].colorFrame == "" {
            arModel?.ARborderThickness = (0,0)
        } else {
            arModel?.ARborderThickness = (4.5, 4.5)
            
        }
    }
    
    func viewDidDisappear() {
        guard let arModel = arModel else { return }
        moduleOutput?.returnModel(model: arModel)
    }
    
    func viewDidLoad() {
        interactor.getFramesModel()
    }
    
}

extension AREditPresenter: AREditInteractorOutput {
    func reciveFrames(with model: [FrameViewModel]) {
        self.modelArray = model
        view?.loadARModel(model: arModel, frameArray: model)
    }
    
}
