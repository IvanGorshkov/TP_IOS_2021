//
//  AREditProtocols.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 01.11.2021.
//  
//

import Foundation

protocol AREditModuleInput {
	var moduleOutput: AREditModuleOutput? { get }
    var arModel: ARViewModel? { get set }
}

protocol AREditModuleOutput: AnyObject {
    func returnModel(model: ARViewModel)
}

protocol AREditViewInput: AnyObject {
    func loadARModel(model: ARViewModel?, frameArray: [FrameViewModel])
}

protocol AREditViewOutput: AnyObject {
    func viewDidLoad()
    func viewDidDisappear()
    func frameDidSelect(index: Int)
    func setWAndRFrame(width: Float, raadius: Float)
}

protocol AREditInteractorInput: AnyObject {
    func getFramesModel()
}

protocol AREditInteractorOutput: AnyObject {
    func reciveFrames(with model: [FrameViewModel])
}

protocol AREditRouterInput: AnyObject {
}

protocol FrameCellProtocol: CellIdentifiable {
    var isSelected: Bool { get }
}
