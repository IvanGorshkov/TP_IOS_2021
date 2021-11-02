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
    func getMaterail() -> String {
        return arModel?.ARmaterialColor ?? ""
    }
    
    func getPicture() -> String {
        return arModel?.ARpic ?? ""
    }
    
    func getFrameWidth() -> Double {
        return (Double(arModel!.ARborderThickness.w) - Double(arModel!.ARwidth)) * 100
    }
    
    func getFrameRouned() -> Double {
        return Double(arModel!.ARborderRounded * 100)
    }
    
    func countItems() -> Int {
        return self.modelArray.count
    }
    
    func item(at index: Int) -> FrameCellProtocol {
        return self.modelArray[index]
    }
    
    func frame(at index: Int) -> String {
        return self.modelArray[index].assertImage
    }
    
    func setWAndRFrame(width: Float, raadius: Float) {
        arModel?.ARborderThickness = (CGFloat(width), CGFloat(width))
        arModel?.ARborderRounded = CGFloat(raadius)
    }
    
    func frameDidSelect(index: Int) {
        arModel?.ARmaterial = self.modelArray[index].imageName
        if self.modelArray[index].assertImage == "" {
            arModel?.ARborderThickness = (0,0)
        }
        interactor.changeSelected(model: modelArray, index: index)
    }
    
    func saveDataAndExit() {
        guard let arModel = arModel else { return }
        moduleOutput?.returnModel(model: arModel)
        router.back(view)
    }
    
    func viewDidDisappear() {
        moduleOutput?.dontSave()
    }
    
    func viewDidLoad() {
        guard let arModel = arModel else { return }
        interactor.getFramesModel(with: arModel)
    }
}

extension AREditPresenter: AREditInteractorOutput {
    func reciveUpdatedFrames(with model: [FrameViewModel]) {
        self.modelArray = model
        view?.updateFrames()
    }
    
    func reciveFrames(with model: [FrameViewModel]) {
        self.modelArray = model
        view?.initFrames()
    }
}
