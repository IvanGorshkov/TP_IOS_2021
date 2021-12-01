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
    private var cartServiceManager: ServiceCartModelInput?
    init() {
        self.cartServiceManager = FBCartServiceManager(interactor: self)
    }
}

extension CartInteractor: CartInteractorInput {
    func getArrays() -> (rentArray: [RentPrice], buyArray: [BuyPrice]) {
        return (arr1, arr2)
    }
    
    func deleteRent(with id: Int) {
        ServiceAddCart.shared.delete(with: id)
        var count = UserDefaults.standard.integer(forKey: "cart_count")
        count = ServiceAddCart.shared.fetchAll().count
        UserDefaults.standard.set(count, forKey: "cart_count")
        NotificationCenter.default.post(name: NSNotification.Name("cart"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name("delete_cart"), object: nil)
        getCartItems()
    }
    
    func deleteBuy(with id: Int) {
        ServiceAddCart.shared.delete(with: id)
        var count = UserDefaults.standard.integer(forKey: "cart_count")
        count = ServiceAddCart.shared.fetchAll().count
        UserDefaults.standard.set(count, forKey: "cart_count")
        NotificationCenter.default.post(name: NSNotification.Name("cart"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name("delete_cart"), object: nil)
        getCartItems()
    }
    
    func getCartItems() {
        let coreDataCart = ServiceAddCart.shared.fetchAll()
        self.cartServiceManager?.loadItemsByIds(with: coreDataCart.map({ cart in
            return Int(cart.id)
        }))
    }
}

extension CartInteractor: ServiceCartModelOutput {
    func itemDidLoad(baseCarts: [BaseCart]) {
        var tmp1 = [RentPrice]()
        var tmp2 = [BuyPrice]()
        let coreDataCart = ServiceAddCart.shared.fetchAll()
        
        baseCarts.forEach { item in
            coreDataCart.forEach { cart in
                if cart.id == item.id {
                    if cart.isRent {
                        tmp1.append(RentPrice(
                            id: item.id,
                            img: item.img ,
                            name: item.name,
                            auther: item.auther,
                            artical: item.artical,
                            amaunt: Int(cart.amount),
                            countRent: Int(cart.rentCount)))
                    } else {
                        tmp2.append(BuyPrice(
                            id: item.id,
                            img: item.img,
                            name: item.name,
                            auther: item.auther,
                            artical: item.artical,
                            amaunt: Int(cart.amount)))
                    }
                }
            }
        }
 
        arr1 = tmp1
        arr2 = tmp2
        output?.getCartItems(rentArray: arr1, buyArray: arr2)
    }
    
    func didFail(with error: Error) {
        print(error.localizedDescription)
    }
}
