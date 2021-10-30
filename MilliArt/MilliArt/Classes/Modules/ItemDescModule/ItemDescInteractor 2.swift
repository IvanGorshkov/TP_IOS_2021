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
    init() {
        self.serviceManagerDescModel = ServiceManagerDescModel(interactor: self)
    }
}

extension ItemDescInteractor: ItemDescInteractorInput {
    func loadItemById(with id: Int) {
        self.serviceManagerDescModel?.loadItemById(with: id)
    }
}

extension ItemDescInteractor: ServiceManagerDescModelOutput {
    func itemDidLoad(itemDesc: ItemDescModel) {
        output?.itemDidLoad(itemDesc: itemDesc)
    }
}
