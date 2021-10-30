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
    var arModel: PaintingARModel? { get set }
}

protocol ARModuleOutput: AnyObject {
}

protocol ARViewInput: AnyObject {
}

protocol ARViewOutput: AnyObject {
    func viewDidLoad()
}

protocol ARInteractorInput: AnyObject {
}

protocol ARInteractorOutput: AnyObject {
}

protocol ARRouterInput: AnyObject {
}
