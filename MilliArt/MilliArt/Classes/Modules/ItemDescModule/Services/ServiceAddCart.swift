//
//  ServiceAddCart.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 10.11.2021.
//

import Foundation
import CoreData

final class ServiceAddCart: ServiceAddCartInput {
    static let shared = ServiceAddCart()
    private var dataManager: DataManagerDescription = DataManager.shared
    
    private init() {
        dataManager.initCoreData {
            print("Init")
        }
    }
    
    func isContain(with id: Int) -> (isSelected: Bool, isRent: Bool) {
        let fetchRequest = Cart.fetchRequest()
        fetchRequest.predicate = NSPredicate.init(format: "id==\(id)")
        let count = self.dataManager.fetch(with: fetchRequest)?.count
        fetchRequest.predicate = NSPredicate.init(format: "id==\(id) AND isRent == 1")
        let isRent = self.dataManager.fetch(with: fetchRequest)?.count
        return (count != 0, isRent != 0)
    }
    
    func fetchAll() -> [Cart] {
        let objects = self.dataManager.fetch(with: Cart.fetchRequest())
        guard let objects = objects else { return [] }
        return objects
    }
    
    func delete(with id: Int) {
        self.dataManager.delete(with: "Cart") {
            let fetchRequest = Cart.fetchRequest()
            fetchRequest.predicate = NSPredicate.init(format: "id==\(id)")
            guard let fetchRequest = fetchRequest as? NSFetchRequest<NSManagedObject> else { return NSFetchRequest<NSManagedObject>() }
            return fetchRequest
        }
    }

    func deleteAll() {
        self.dataManager.delete(with: "Cart") {
            let fetchRequest = Cart.fetchRequest()
            guard let fetchRequest = fetchRequest as? NSFetchRequest<NSManagedObject> else { return NSFetchRequest<NSManagedObject>() }
            return fetchRequest
        }
    }
    
    func insert(with model: ItemDescModel, isRent: Bool) {
        self.dataManager.create(with: "Cart") { item in
            guard let cart = item as? Cart else {
                return
            }
    
            cart.isRent = isRent
            cart.id = Int32(model.id)
            cart.rentCount = Int32(model.countRent)
            cart.amount = isRent ? Int32(model.rent) : Int32(model.amount)
        }
    }
}
