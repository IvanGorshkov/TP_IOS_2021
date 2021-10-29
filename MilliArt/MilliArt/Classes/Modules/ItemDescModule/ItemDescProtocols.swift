//
//  ItemDescProtocols.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import Foundation
import ImageSlideshow

protocol ItemDescModuleInput {
	var moduleOutput: ItemDescModuleOutput? { get }
}

protocol ItemDescModuleOutput: AnyObject {
}

protocol ItemDescViewInput: AnyObject {
    func updateForSections(_ sections: SectionRowsRepresentable)
}

protocol ItemDescCellViewOutput: AnyObject {
    func openFullScreen(silder: ImageSlideshow)
    func clickBuy()
    func clickRent()
    func clickFav()
    func clickAR()
}

protocol ItemDescViewOutput: AnyObject {
    func viewDidLoad()
}

protocol ItemDescInteractorInput: AnyObject {
    func loadItemById(with id: Int)
}

protocol ItemDescInteractorOutput: AnyObject {
    func itemDidLoad(itemDesc: ItemDescModel)
}

protocol ItemDescRouterInput: AnyObject {
}

protocol CellIdentifiable {
    var cellIdentifier: String { get }
    var cellHeight: Float { get }
}

protocol SectionRowsRepresentable {
    var rows: [CellIdentifiable] { get set }
    var delegate: ItemDescCellViewOutput? { get set }
}

protocol ModelRepresentable {
    var model: CellIdentifiable? { get set }
}
