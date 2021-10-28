//
//  CartProtocols.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import Foundation

protocol CartModuleInput {
	var moduleOutput: CartModuleOutput? { get }
}

protocol CartModuleOutput: AnyObject {
}

protocol CartViewInput: AnyObject {
}

protocol CartViewOutput: AnyObject {
}

protocol CartInteractorInput: AnyObject {
}

protocol CartInteractorOutput: AnyObject {
}

protocol CartRouterInput: AnyObject {
}
