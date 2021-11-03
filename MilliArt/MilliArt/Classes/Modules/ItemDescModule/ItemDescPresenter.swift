//
//  ItemDescPresenter.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import Foundation
import UIKit

final class ItemDescPresenter {
	weak var view: ItemDescViewInput?
    weak var moduleOutput: ItemDescModuleOutput?

	private let router: ItemDescRouterInput
	private let interactor: ItemDescInteractorInput
    private var itemDescSectionModel: ItemDescSectionModel?
    init(router: ItemDescRouterInput, interactor: ItemDescInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension ItemDescPresenter: ItemDescModuleInput {
}

extension ItemDescPresenter: ItemDescViewOutput {
    func openFullScreen(slider: UIView?) {
        router.openFullScreen(from: view, silder: slider)
    }
    
    var sectionDelegate: ItemDescCellViewOutput? {
        get {
            guard let itemDescSectionModel = itemDescSectionModel else { return nil }
            return itemDescSectionModel.delegate
        }
        set {
            itemDescSectionModel?.delegate = newValue
        }
    }
    
    func getCountCells() -> Int {
        guard let itemDescSectionModel = itemDescSectionModel else { return 0 }
        return itemDescSectionModel.rows.count
    }
    
    func getCellIdentifier(at index: Int) -> String {
        guard let itemDescSectionModel = itemDescSectionModel else { return "" }
        return itemDescSectionModel.rows[index].cellIdentifier
    }
    
    func getCell(at index: Int) -> CellIdentifiable? {
        guard let itemDescSectionModel = itemDescSectionModel else { return nil }
        return itemDescSectionModel.rows[index]
    }
    
    
    func getCellHeight(at index: Int) -> Float {
        guard let itemDescSectionModel = itemDescSectionModel else { return 0 }
        return itemDescSectionModel.rows[index].cellHeight
    }
    
    func goToAR() {
        interactor.loadFirstPhoto()
    }
    
    func changeMonthCount(value: Int) {
        interactor.changeMonthCount(value: value)
    }
    
    func viewDidLoad() {
        interactor.loadItemById(with: 1)
    }
    
}

extension ItemDescPresenter: ItemDescInteractorOutput {
    func firstPhotoDidLoad(arModel: PaintingARModel) {
        router.goToAR(from: view, arModel: arModel)
    }
    
    func updateRentPrice(itemDesc: ItemDescModel) {
        guard let itemDescSectionModel = itemDescSectionModel else { return }
        guard let amount = itemDescSectionModel.rows[2] as? AmountDescCellModel else { return }
        amount.countRent = itemDesc.countRent
        view?.updateRentPrice()
    }
    
    func itemDidLoad(itemDesc: ItemDescModel) {
        self.itemDescSectionModel = ItemDescSectionModel(itemDesc)
        view?.updateForSections()
    }
}
