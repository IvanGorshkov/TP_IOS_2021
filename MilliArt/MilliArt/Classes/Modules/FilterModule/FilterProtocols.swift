//
//  FilterProtocols.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import Foundation

protocol FilterModuleInput {
	var moduleOutput: FilterModuleOutput? { get }
}

protocol FilterModuleOutput: AnyObject {
}

protocol FilterViewInput: AnyObject {
}

protocol FilterViewOutput: AnyObject {
}

protocol FilterInteractorInput: AnyObject {
}

protocol FilterInteractorOutput: AnyObject {
}

protocol FilterRouterInput: AnyObject {
}
