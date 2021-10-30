//
//  ItemDescInteractor.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import Foundation

final class ItemDescInteractor {
	weak var output: ItemDescInteractorOutput?
    private var serviceManagerDescModel: ServiceManagerDescModelInput?
    private var itemDescModel: ItemDescModel?
    init() {
        self.serviceManagerDescModel = ServiceManagerDescModel(interactor: self)
    }
}

extension ItemDescInteractor: ItemDescInteractorInput {
    func changeMonthCount(value: Int) {
        itemDescModel?.countRent = value
        guard let itemDescModel =  itemDescModel else { return }
        output?.updateRentPrice(itemDesc: itemDescModel)
    }
    
    func loadItemById(with id: Int) {
        self.serviceManagerDescModel?.loadItemById(with: id)
    }
}

extension ItemDescInteractor: ServiceManagerDescModelOutput {
    func itemDidLoad(itemDesc: ItemDescModel) {
        self.itemDescModel = itemDesc
        output?.itemDidLoad(itemDesc: itemDesc)
    }
}
