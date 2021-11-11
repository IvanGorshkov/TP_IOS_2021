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
    
    var array  = [ItemDescModel(
        id: 1, name: "Следы войны", author: "Гелий Коржев", vendorСode: "vse-isk-34", pictures: ["korzev", "pic1", "pic1"],
        amount: 34000, rent: 1200, description:
            """
        На гребне волны, На гребне волны, На гребне волны, На гребне волны.\n
        На гребне волны, На гребне волны, На гребне волны, На гребне волны\n
        На гребне волны, На гребне волны
        """,
        specifications: [
            Specifications(title: "Автор", specification: "Гелий Коржев"),
            Specifications(title: "Размер", specification: "80 x 155 см"),
            Specifications(title: "Категория", specification: "Фотография"),
            Specifications(title: "Гамма", specification: "Оранжевый"),
            Specifications(title: "Тематика", specification: "Натюрморт"),
            Specifications(title: "Формат", specification: "Вертикальный")
        ], countRent: 1
    ), ItemDescModel(
        id: 2, name: "На гребне волны", author: "Анастасия Колесниченко", vendorСode: "vse-isk-35", pictures: ["pic1", "pic1", "pic1"],
        amount: 34000, rent: 1200, description:
            """
        На гребне волны, На гребне волны, На гребне волны, На гребне волны.\n
        На гребне волны, На гребне волны, На гребне волны, На гребне волны\n
        На гребне волны, На гребне волны
        """,
        specifications: [
            Specifications(title: "Автор", specification: "Анастасия Колесниченко"),
            Specifications(title: "Размер", specification: "80 x 155 см"),
            Specifications(title: "Категория", specification: "Фотография"),
            Specifications(title: "Гамма", specification: "Оранжевый"),
            Specifications(title: "Тематика", specification: "Натюрморт"),
            Specifications(title: "Формат", specification: "Вертикальный")
        ], countRent: 1
    ), ItemDescModel(
        id: 3, name: "На гребне волны", author: "Анастасия Колесниченко", vendorСode: "vse-isk-36", pictures: ["pic2", "pic1", "pic1"],
        amount: 34000, rent: 1200, description:
            """
        На гребне волны, На гребне волны, На гребне волны, На гребне волны.\n
        На гребне волны, На гребне волны, На гребне волны, На гребне волны\n
        На гребне волны, На гребне волны
        """,
        specifications: [
            Specifications(title: "Автор", specification: "Анастасия Колесниченко"),
            Specifications(title: "Размер", specification: "80 x 155 см"),
            Specifications(title: "Категория", specification: "Фотография"),
            Specifications(title: "Гамма", specification: "Оранжевый"),
            Specifications(title: "Тематика", specification: "Натюрморт"),
            Specifications(title: "Формат", specification: "Вертикальный")
        ], countRent: 1
    ), ItemDescModel(
        id: 4, name: "На гребне волны", author: "Анастасия Колесниченко", vendorСode: "vse-isk-38", pictures: ["pic3", "pic1", "pic1"],
        amount: 34000, rent: 1200, description:
            """
        На гребне волны, На гребне волны, На гребне волны, На гребне волны.\n
        На гребне волны, На гребне волны, На гребне волны, На гребне волны\n
        На гребне волны, На гребне волны
        """,
        specifications: [
            Specifications(title: "Автор", specification: "Анастасия Колесниченко"),
            Specifications(title: "Размер", specification: "80 x 155 см"),
            Specifications(title: "Категория", specification: "Фотография"),
            Specifications(title: "Гамма", specification: "Оранжевый"),
            Specifications(title: "Тематика", specification: "Натюрморт"),
            Specifications(title: "Формат", specification: "Вертикальный")
        ], countRent: 1
    ), ItemDescModel(
        id: 5, name: "Зимняя дорога. Версты", author: "Валентин Сидоров", vendorСode: "vse-isk-30", pictures: ["sidorov", "pic1", "pic1"],
        amount: 34000, rent: 1200, description:
            """
        На гребне волны, На гребне волны, На гребне волны, На гребне волны.\n
        На гребне волны, На гребне волны, На гребне волны, На гребне волны\n
        На гребне волны, На гребне волны
        """,
        specifications: [
            Specifications(title: "Автор", specification: "Валентин Сидоров"),
            Specifications(title: "Размер", specification: "80 x 155 см"),
            Specifications(title: "Категория", specification: "Фотография"),
            Specifications(title: "Гамма", specification: "Оранжевый"),
            Specifications(title: "Тематика", specification: "Натюрморт"),
            Specifications(title: "Формат", specification: "Вертикальный")
        ], countRent: 1
    ), ItemDescModel(
        id: 6, name: "Портрет А. С. Пушкина", author: "Кипренский", vendorСode: "vse-isk-342", pictures: ["Pushkin", "pic1", "pic1"],
        amount: 34000, rent: 1200, description:
            """
        На гребне волны, На гребне волны, На гребне волны, На гребне волны.\n
        На гребне волны, На гребне волны, На гребне волны, На гребне волны\n
        На гребне волны, На гребне волны
        """,
        specifications: [
            Specifications(title: "Автор", specification: "Кипренский"),
            Specifications(title: "Размер", specification: "80 x 155 см"),
            Specifications(title: "Категория", specification: "Фотография"),
            Specifications(title: "Гамма", specification: "Оранжевый"),
            Specifications(title: "Тематика", specification: "Натюрморт"),
            Specifications(title: "Формат", specification: "Вертикальный")
        ], countRent: 1
    ), ItemDescModel(
        id: 7, name: "Портрет А. С. Пушкина", author: "Кипренский", vendorСode: "vse-isk-3433", pictures: ["Pushkin", "pic1", "pic1"],
        amount: 34000, rent: 1200, description:
            """
        На гребне волны, На гребне волны, На гребне волны, На гребне волны.\n
        На гребне волны, На гребне волны, На гребне волны, На гребне волны\n
        На гребне волны, На гребне волны
        """,
        specifications: [
            Specifications(title: "Автор", specification: "Кипренский"),
            Specifications(title: "Размер", specification: "80 x 155 см"),
            Specifications(title: "Категория", specification: "Фотография"),
            Specifications(title: "Гамма", specification: "Оранжевый"),
            Specifications(title: "Тематика", specification: "Натюрморт"),
            Specifications(title: "Формат", specification: "Вертикальный")
        ], countRent: 1
    ), ItemDescModel(
        id: 8, name: "Зимняя дорога. Версты", author: "Валентин Сидоров", vendorСode: "vse-isk-31", pictures: ["sidorov", "pic1", "pic1"],
        amount: 34000, rent: 1200, description:
            """
        На гребне волны, На гребне волны, На гребне волны, На гребне волны.\n
        На гребне волны, На гребне волны, На гребне волны, На гребне волны\n
        На гребне волны, На гребне волны
        """,
        specifications: [
            Specifications(title: "Автор", specification: "Валентин Сидоров"),
            Specifications(title: "Размер", specification: "80 x 155 см"),
            Specifications(title: "Категория", specification: "Фотография"),
            Specifications(title: "Гамма", specification: "Оранжевый"),
            Specifications(title: "Тематика", specification: "Натюрморт"),
            Specifications(title: "Формат", specification: "Вертикальный")
        ], countRent: 1
    ), ItemDescModel(
        id: 9, name: "На гребне волны", author: "Анастасия Колесниченко", vendorСode: "vse-isk-341", pictures: ["pic3", "pic1", "pic1"],
        amount: 34000, rent: 1200, description:
            """
        На гребне волны, На гребне волны, На гребне волны, На гребне волны.\n
        На гребне волны, На гребне волны, На гребне волны, На гребне волны\n
        На гребне волны, На гребне волны
        """,
        specifications: [
            Specifications(title: "Автор", specification: "Анастасия Колесниченко"),
            Specifications(title: "Размер", specification: "80 x 155 см"),
            Specifications(title: "Категория", specification: "Фотография"),
            Specifications(title: "Гамма", specification: "Оранжевый"),
            Specifications(title: "Тематика", specification: "Натюрморт"),
            Specifications(title: "Формат", specification: "Вертикальный")
        ], countRent: 1
    ), ItemDescModel(
        id: 10, name: "На гребне волны", author: "Анастасия Колесниченко", vendorСode: "vse-isk-343", pictures: ["pic2", "pic1", "pic1"],
        amount: 34000, rent: 1200, description:
            """
        На гребне волны, На гребне волны, На гребне волны, На гребне волны.\n
        На гребне волны, На гребне волны, На гребне волны, На гребне волны\n
        На гребне волны, На гребне волны
        """,
        specifications: [
            Specifications(title: "Автор", specification: "Анастасия Колесниченко"),
            Specifications(title: "Размер", specification: "80 x 155 см"),
            Specifications(title: "Категория", specification: "Фотография"),
            Specifications(title: "Гамма", specification: "Оранжевый"),
            Specifications(title: "Тематика", specification: "Натюрморт"),
            Specifications(title: "Формат", specification: "Вертикальный")
        ], countRent: 1
    ), ItemDescModel(
        id: 11, name: "На гребне волны", author: "Анастасия Колесниченко", vendorСode: "vse-isk-341", pictures: ["pic1", "pic1", "pic1"],
        amount: 34000, rent: 1200, description:
            """
        На гребне волны, На гребне волны, На гребне волны, На гребне волны.\n
        На гребне волны, На гребне волны, На гребне волны, На гребне волны\n
        На гребне волны, На гребне волны
        """,
        specifications: [
            Specifications(title: "Автор", specification: "Анастасия Колесниченко"),
            Specifications(title: "Размер", specification: "80 x 155 см"),
            Specifications(title: "Категория", specification: "Фотография"),
            Specifications(title: "Гамма", specification: "Оранжевый"),
            Specifications(title: "Тематика", specification: "Натюрморт"),
            Specifications(title: "Формат", specification: "Вертикальный")
        ], countRent: 1
    ), ItemDescModel(
        id: 12, name: "Следы войны", author: "Гелий Коржев", vendorСode: "vse-isk-3433", pictures: ["korzev", "pic1", "pic1"],
        amount: 34000, rent: 1200, description:
            """
        На гребне волны, На гребне волны, На гребне волны, На гребне волны.\n
        На гребне волны, На гребне волны, На гребне волны, На гребне волны\n
        На гребне волны, На гребне волны
        """,
        specifications: [
            Specifications(title: "Автор", specification: "Гелий Коржев"),
            Specifications(title: "Размер", specification: "80 x 155 см"),
            Specifications(title: "Категория", specification: "Фотография"),
            Specifications(title: "Гамма", specification: "Оранжевый"),
            Specifications(title: "Тематика", specification: "Натюрморт"),
            Specifications(title: "Формат", specification: "Вертикальный")
        ], countRent: 1
    )
    ]
    
    func loadItemById(with id: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            guard let array = self?.array else { return }
            self?.output?.itemDidLoad(itemDesc: array[id])
        }
    }
}
