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
    let arr1 = [
        RentPrice(img: "pic1", name: "Ярослав Шейн", auther: "Гончии1", artical: "А-157", amaunt: 3570, countRent: 8),
        RentPrice(img: "pic2", name: "Ярослав Шейн", auther: "Гончии2", artical: "А-127", amaunt: 350, countRent: 8),
        RentPrice(img: "pic3", name: "Ярослав Тейн", auther: "Гончии3", artical: "А-123", amaunt: 9220, countRent: 1)
    ]
    
    let arr2 = [
        BuyPrice(img: "pic1", name: "Ярослав Шейн", auther: "Гончии1", artical: "А-157", amaunt: 3570),
        BuyPrice(img: "pic2", name: "Ярослав Шейн", auther: "Гончии2", artical: "А-127", amaunt: 350),
        BuyPrice(img: "pic3", name: "Ярослав Тейн", auther: "Гончии3", artical: "А-123", amaunt: 9220)
    ]
}

extension CartInteractor: CartInteractorInput {
    func getCartItems() {
        output?.getCartItems(rentArray: arr1, buyArray: arr2)
    }
}
