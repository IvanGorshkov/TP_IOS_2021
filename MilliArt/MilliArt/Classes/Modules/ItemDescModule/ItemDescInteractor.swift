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
}

extension ItemDescInteractor: ItemDescInteractorInput {
    func loadItemById(with id: Int) {
        output?.itemDidLoad(itemDesc: ItemDescModel(
                                    name: "На гребне волны", pictures: ["pic1", "pic1", "pic1"],
                                    amount: 34000, rent: 1200, description: "На гребне волны, На гребне волны, На гребне волны, На гребне волны. На гребне волны, На гребне волны, На гребне волны, На гребне волны\nНа гребне волны, На гребне волны",
                                    specifications: [
                                        Specifications(title: "Автор", specification: "Анастасия Колесниченко"),
                                        Specifications(title: "Размер", specification: "51 x 34 см"),
                                        Specifications(title: "Категория", specification: "Фотография"),
                                        Specifications(title: "Гамма", specification: "Оранжевый"),
                                        Specifications(title: "Тематика", specification: "Натюрморт"),
                                        Specifications(title: "Формат", specification: "Вертикальный"),
        ]))
    }
}
