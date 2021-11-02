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
    func dontSave()
}

protocol AREditViewInput: AnyObject {
    func updateFrames()
    func initFrames()
}

protocol AREditViewOutput: AnyObject {
    func viewDidLoad()
    func viewDidDisappear()
    func saveDataAndExit()
    func frameDidSelect(index: Int)
    func setWAndRFrame(width: Float, raadius: Float)
    func countItems() -> Int
    func getMaterail() -> String
    func getPicture() -> String
    func getFrameWidth() -> Double
    func getFrameRouned() -> Double
    func item(at index: Int) -> FrameCellProtocol
    func frame(at index: Int) -> String
}

protocol AREditInteractorInput: AnyObject {
    func getFramesModel(with model: ARViewModel)
    func changeSelected(model: [FrameViewModel], index: Int)
}

protocol AREditInteractorOutput: AnyObject {
    func reciveFrames(with model: [FrameViewModel])
    func reciveUpdatedFrames(with model: [FrameViewModel])
}

protocol AREditRouterInput: AnyObject {
    func back(_ vc: AREditViewInput?)
}

protocol FrameCellProtocol: CellIdentifiable {
    var isSelected: Bool { get }
    var assertImage: String { get }
    var imageName: String { get }
}
