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
    private var isSelected: Bool = false
    
    private var serviceManagerDescModel: ServiceManagerDescModelInput?
    private var itemDescModel: ItemDescModel?
    init() {
        self.serviceManagerDescModel = ServiceManagerDescModel(interactor: self)
    }
}

extension ItemDescInteractor: ItemDescInteractorInput {
    func addToCart(selected: Bool, isRent: Bool, countMonth: Int?) {
        var count = UserDefaults.standard.integer(forKey: "cart_count")
        
        print(selected, isSelected)
        if !isSelected && selected {
            count += 1
        }
        if isSelected && !selected {
            count -= 1
        }
        
        isSelected = selected
        UserDefaults.standard.set(count, forKey: "cart_count")
        NotificationCenter.default.post(name: NSNotification.Name("cart"), object: nil)
    }
    
    func loadFirstPhoto() {
        let sizes = itemDescModel?.specifications.filter({
            return $0.title == "Размер"
        }).first?.specification

        guard let sizeArray = sizes?.components(separatedBy: CharacterSet(charactersIn: "xх×")).map({ str in
            return Float(str.filter { ("0"..."9").contains($0) })
        }) else { return }

        output?.firstPhotoDidLoad(arModel:
                                    PaintingARModel(pic: itemDescModel?.pictures.first, width: sizeArray[1] ?? 0, height: sizeArray[0] ?? 0)
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
