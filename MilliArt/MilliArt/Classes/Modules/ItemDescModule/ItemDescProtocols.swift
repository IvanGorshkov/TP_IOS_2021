//
//  ItemDescProtocols.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import Foundation
import UIKit

protocol ItemDescModuleInput {
	var moduleOutput: ItemDescModuleOutput? { get }
}

protocol ItemDescModuleOutput: AnyObject {
}

protocol ItemDescCellViewOutput: AnyObject {
    func openFullScreen(silder: UIView)
    func clickBuy()
    func clickRent()
    func clickFav()
    func clickAR()
    func openPicker()
}

protocol ItemDescViewInput: AnyObject {
    func updateForSections()
    func updateRentPrice()
}

protocol ItemDescViewOutput: AnyObject {
    func viewDidLoad()
    func changeMonthCount(value: Int)
    func goToAR()
    func getCellHeight(at index: Int) -> Float
    func getCell(at index: Int) -> CellIdentifiable?
    func getCellIdentifier(at index: Int) -> String
    func getCountCells() -> Int
    var  sectionDelegate: ItemDescCellViewOutput? { get set }
    func openFullScreen(slider: UIView?)
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
    func openFullScreen(from vc: ItemDescViewInput?, silder: UIView?)
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

protocol ServiceManagerDescModelInput: AnyObject {
    func loadItemById(with id: Int)
}

protocol ServiceManagerDescModelOutput: AnyObject {
    func itemDidLoad(itemDesc: ItemDescModel)
}
