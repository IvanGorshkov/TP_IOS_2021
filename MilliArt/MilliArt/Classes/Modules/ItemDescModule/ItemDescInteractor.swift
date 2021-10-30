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
    func loadFirstPhoto() {
        let sizes = itemDescModel?.specifications.filter({ specification in
            return specification.title == "Размер"
        }).first?.specification
        
        guard let sizeArray = sizes?.split(separator: "x").map({ str in
            return Int(str.filter { ("0"..."9").contains($0) })
        }) else { return }
        
        output?.firstPhotoDidLoad(arModel:
                                    PaintingARModel(pic: itemDescModel?.pictures.first, width: sizeArray[0] ?? 0, height: sizeArray[1] ?? 0)
        )
    }
    
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
