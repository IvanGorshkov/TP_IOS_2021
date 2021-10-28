//
//  SearchProtocols.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import Foundation

protocol SearchModuleInput {
	var moduleOutput: SearchModuleOutput? { get }
}

protocol SearchModuleOutput: AnyObject {
}

protocol SearchViewInput: AnyObject {
}

protocol SearchViewOutput: AnyObject {
    func goToFilter()
}

protocol SearchInteractorInput: AnyObject {
}

protocol SearchInteractorOutput: AnyObject {
}

protocol SearchRouterInput: AnyObject {
    func goToFilterVC(from vc: SearchViewInput?)
}
