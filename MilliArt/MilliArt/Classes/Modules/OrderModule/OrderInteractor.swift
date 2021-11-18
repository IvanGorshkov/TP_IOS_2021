//
//  OrderInteractor.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 12.11.2021.
//  
//

import Foundation

final class OrderInteractor {
	weak var output: OrderInteractorOutput?
    private var orderId = Int()
    var arr1 = [RentPrice]()
    var arr2 = [BuyPrice]()
    private var cartServiceManager: ServiceCartModelInput?
    init() {
        self.cartServiceManager = FBCartServiceManager(interactor: self)
    }
}

extension OrderInteractor: OrderInteractorInput {
    func getCartItems() {
        let coreDataCart = ServiceAddCart.shared.fetchAll()
        self.cartServiceManager?.loadItemsByIds(with: coreDataCart.map({ cart in
            return Int(cart.id)
        }))
    }
    
    var numberOrder: Int {
        get {
            return orderId
        }
        set {
            orderId = newValue
        }
    }
}


extension OrderInteractor: ServiceCartModelOutput {
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
        ServiceAddCart.shared.deleteAll()
        var count = UserDefaults.standard.integer(forKey: "cart_count")
        count = 0
        UserDefaults.standard.set(count, forKey: "cart_count")
        NotificationCenter.default.post(name: NSNotification.Name("cart"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name("delete_cart"), object: nil)
    }
    
    func didFail(with error: Error) {
        print(error.localizedDescription)
    }
}
