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
    var arModel: PaintingARModel? { get set }
}

protocol AREditModuleOutput: AnyObject {
    func returnModel(model: PaintingARModel)
}

protocol AREditViewInput: AnyObject {
}

protocol AREditViewOutput: AnyObject {
    func viewDidLoad()
    func viewDidDisappear()
}

protocol AREditInteractorInput: AnyObject {
}

protocol AREditInteractorOutput: AnyObject {
}

protocol AREditRouterInput: AnyObject {
}
