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



protocol ItemDescCellViewOutput: AnyObject {
    func openFullScreen(silder: ImageSlideshow)
    func clickBuy()
    func clickRent()
    func clickFav()
    func clickAR()
    func openPicker()
}

protocol ItemDescViewInput: AnyObject {
    func updateForSections(_ sections: SectionRowsRepresentable)
    func updateRentPrice(_ sections: SectionRowsRepresentable)
}

protocol ItemDescViewOutput: AnyObject {
    func viewDidLoad()
    func changeMonthCount(value: Int)
    func goToAR()
}

protocol ItemDescInteractorInput: AnyObject {
    func loadItemById(with id: Int)
    func changeMonthCount(value: Int)
    func loadFirstPhoto()
}

protocol ItemDescInteractorOutput: AnyObject {
    func itemDidLoad(itemDesc: ItemDescModel)
    func updateRentPrice(itemDesc: ItemDescModel)
    func firstPhotoDidLoad(arModel: PaintingARModel)
}

protocol ItemDescRouterInput: AnyObject {
    func goToAR(from vc: ItemDescViewInput?, arModel: PaintingARModel?)
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

protocol ServiceManagerDescModelInput: AnyObject {
    func loadItemById(with id: Int)
}

protocol ServiceManagerDescModelOutput: AnyObject {
    func itemDidLoad(itemDesc: ItemDescModel)
}
