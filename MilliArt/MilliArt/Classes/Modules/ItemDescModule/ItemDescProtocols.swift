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
    func updateForSections(_ sections: [SectionRowsRepresentable])
}

protocol ItemDescViewOutput: AnyObject {
    func viewDidLoad()
}

protocol ItemDescInteractorInput: AnyObject {
}

protocol ItemDescInteractorOutput: AnyObject {
}

protocol ItemDescRouterInput: AnyObject {
}

protocol CellIdentifiable {
    var cellIdentifier: String { get }
    var cellHeight: Float { get }
}

protocol SectionRowsRepresentable {
    var rows: [CellIdentifiable] { get set }
}

protocol ModelRepresentable {
    var model: CellIdentifiable? { get set }
}
