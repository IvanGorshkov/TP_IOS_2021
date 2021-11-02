//
//  ARProtocols.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 31.10.2021.
//  
//

import Foundation

protocol ARModuleInput {
	var moduleOutput: ARModuleOutput? { get }
    var arViewModel: ARViewModel? { get set }
}

protocol ARModuleOutput: AnyObject {
}

protocol ARViewInput: AnyObject {
    func runSession()
    func loadModel(arModel: ARViewModel?)
}

protocol ARViewOutput: AnyObject {
    func viewDidLoad()
    func openEditFrame()
}

protocol ARInteractorInput: AnyObject {
}

protocol ARInteractorOutput: AnyObject {
}

protocol ARRouterInput: AnyObject {
    func goToAR(from vc: ARViewInput?, arModel: ARViewModel?, presenter: AREditModuleOutput)
}
