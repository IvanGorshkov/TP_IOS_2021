//
//  AREditInteractor.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 01.11.2021.
//  
//

import Foundation

final class AREditInteractor {
	weak var output: AREditInteractorOutput?
}

extension AREditInteractor: AREditInteractorInput {
    func changeSelected(model: [FrameViewModel], index: Int) {
        for i in (0..<model.count) {
            model[i].isSelected = index == i
        }
        output?.reciveUpdatedFrames(with: model)
    }
    
    func getFramesModel(with model: ARViewModelDescription) {
        output?.reciveFrames(with: [
            FrameViewModel(colorFrame: "", isSelected: model.ARmaterial == ""),
            FrameViewModel(colorFrame: "Black", isSelected: model.ARmaterial == "Black"),
            FrameViewModel(colorFrame: "White", isSelected: model.ARmaterial == "White"),
            FrameViewModel(colorFrame: "Silver", isSelected: model.ARmaterial == "Silver"),
            FrameViewModel(colorFrame: "Light Wood", isSelected: model.ARmaterial == "Light Wood"),
            FrameViewModel(colorFrame: "Dark Wood", isSelected: model.ARmaterial == "Dark Wood")
        ])
    }
    
}
