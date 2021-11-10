//
//  CartInteractor.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import Foundation

final class CartInteractor {
	weak var output: CartInteractorOutput?
    var arr1 = [RentPrice]()
    var arr2 = [BuyPrice]()
}

extension CartInteractor: CartInteractorInput {
    func deleteRent(with id: Int) {
        ServiceAddCart.shared.delete(with: id)
        var count = UserDefaults.standard.integer(forKey: "cart_count")
        count -= 1
        UserDefaults.standard.set(count, forKey: "cart_count")
        NotificationCenter.default.post(name: NSNotification.Name("cart"), object: nil)
        getCartItems()
    }
    
    func deleteBuy(with id: Int) {
        ServiceAddCart.shared.delete(with: id)
        var count = UserDefaults.standard.integer(forKey: "cart_count")
        count -= 1
        UserDefaults.standard.set(count, forKey: "cart_count")
        NotificationCenter.default.post(name: NSNotification.Name("cart"), object: nil)
        getCartItems()
    }
    
    func getCartItems() {
        let coreDataCart = ServiceAddCart.shared.fetchAll()
        var tmp1 = [RentPrice]()
        var tmp2 = [BuyPrice]()
        array.forEach { item in
            coreDataCart.forEach { cart in
                if cart.id == item.id {
                    if cart.isRent {
                        tmp1.append(RentPrice(
                            id: item.id,
                            img: item.pictures.first ?? "",
                            name: item.name,
                            auther: "Ярослав Тейн",
                            artical: "Ярослав Тейн",
                            amaunt: Int(cart.amount),
                            countRent: Int(cart.rentCount)))
                    } else {
                        tmp2.append(BuyPrice(
                            id: item.id,
                            img: item.pictures.first ?? "",
                            name: item.name,
                            auther: "Ярослав Тейн",
                            artical: "Ярослав Тейн",
                            amaunt: Int(cart.amount)))
                    }
                }
            }
        }
        arr1 = tmp1
        arr2 = tmp2
        output?.getCartItems(rentArray: arr1, buyArray: arr2)
    }
}

var array  = [ItemDescModel(
    id: 1, name: "На гребне волны", pictures: ["korzev", "pic1", "pic1"],
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
    id: 2, name: "На гребне волны", pictures: ["pic1", "pic1", "pic1"],
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
    id: 3, name: "На гребне волны", pictures: ["pic2", "pic1", "pic1"],
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
    id: 4, name: "На гребне волны", pictures: ["pic3", "pic1", "pic1"],
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
    id: 5, name: "На гребне волны", pictures: ["sidorov", "pic1", "pic1"],
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
    id: 6, name: "На гребне волны", pictures: ["Pushkin", "pic1", "pic1"],
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
    id: 7, name: "На гребне волны", pictures: ["Pushkin", "pic1", "pic1"],
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
    id: 8, name: "На гребне волны", pictures: ["sidorov", "pic1", "pic1"],
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
    id: 9, name: "На гребне волны", pictures: ["pic3", "pic1", "pic1"],
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
    id: 10, name: "На гребне волны", pictures: ["pic2", "pic1", "pic1"],
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
    id: 11, name: "На гребне волны", pictures: ["pic1", "pic1", "pic1"],
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
    id: 12, name: "На гребне волны", pictures: ["korzev", "pic1", "pic1"],
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
)
]
