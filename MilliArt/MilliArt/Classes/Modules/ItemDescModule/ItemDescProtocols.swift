//
//  ItemDescProtocols.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import Foundation

protocol ItemDescModuleInput {
	var moduleOutput: ItemDescModuleOutput? { get }
}

protocol ItemDescModuleOutput: AnyObject {
}

protocol ItemDescViewInput: AnyObject {
}

protocol ItemDescViewOutput: AnyObject {
}

protocol ItemDescInteractorInput: AnyObject {
}

protocol ItemDescInteractorOutput: AnyObject {
}

protocol ItemDescRouterInput: AnyObject {
}
