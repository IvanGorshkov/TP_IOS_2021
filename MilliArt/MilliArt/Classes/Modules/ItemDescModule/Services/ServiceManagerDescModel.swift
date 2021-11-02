//
//  ServiceManagerDescModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import Foundation

final class ServiceManagerDescModel: ServiceManagerDescModelInput {
    weak var output: ServiceManagerDescModelOutput?
    init(interactor: ServiceManagerDescModelOutput?) {
        output = interactor
    }
    
    func loadItemById(with id: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.output?.itemDidLoad(itemDesc: ItemDescModel(
                name: "На гребне волны", pictures: ["sidorov", "pic1", "pic1"],
                amount: 34000, rent: 1200, description: "На гребне волны, На гребне волны, На гребне волны, На гребне волны. На гребне волны, На гребне волны, На гребне волны, На гребне волны\nНа гребне волны, На гребне волны",
                specifications: [
                    Specifications(title: "Автор", specification: "Анастасия Колесниченко"),
                    Specifications(title: "Размер", specification: "80 x 155 см"),
                    Specifications(title: "Категория", specification: "Фотография"),
                    Specifications(title: "Гамма", specification: "Оранжевый"),
                    Specifications(title: "Тематика", specification: "Натюрморт"),
                    Specifications(title: "Формат", specification: "Вертикальный")
                ], countRent: 1
                    )
                )
        }
    }
}
