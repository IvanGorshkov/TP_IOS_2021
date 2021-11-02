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
    func getFramesModel() {
        output?.reciveFrames(with: [
            FrameViewModel(colorFrame: "", isSelected: true),
            FrameViewModel(colorFrame: "Black", isSelected: false),
            FrameViewModel(colorFrame: "White", isSelected: false),
            FrameViewModel(colorFrame: "Silver", isSelected: false),
            FrameViewModel(colorFrame: "Light Wood", isSelected: false),
            FrameViewModel(colorFrame: "Dark Wood", isSelected: false)
        ])
    }
    
}
