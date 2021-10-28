//
//  MainProtocols.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import Foundation

protocol MainModuleInput {
	var moduleOutput: MainModuleOutput? { get }
}

protocol MainModuleOutput: AnyObject {
}

protocol MainViewInput: AnyObject {
}

protocol MainViewOutput: AnyObject {
}

protocol MainInteractorInput: AnyObject {
}

protocol MainInteractorOutput: AnyObject {
}

protocol MainRouterInput: AnyObject {
}
