//
//  Cart+CoreDataProperties.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 10.11.2021.
//
//

import Foundation
import CoreData

extension Cart {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cart> {
        return NSFetchRequest<Cart>(entityName: "Cart")
    }

    @NSManaged public var id: Int32
    @NSManaged public var amount: Int32
    @NSManaged public var rentCount: Int32
    @NSManaged public var isRent: Bool
}

extension Cart: Identifiable {
}
