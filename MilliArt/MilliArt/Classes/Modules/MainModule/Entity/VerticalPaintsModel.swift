//
//  VerticalPaintsModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 05.11.2021.
//

import Firebase

struct VerticalPaintsModel {
    let id: Int
    let pic: String
    let name: String
    let size: String
    let price: String
    let height: Int
    let width: Int
}

final class ArtConverter: ConverterDescription {
    enum Key: String {
        case name
        case id
        case price
        case pics
        case specification
        case height
        case weight
    }
    
    func product<T>(from document: DocumentSnapshot) -> T? {
        guard let dict = document.data() else { return nil }
        let title = dict[Key.name.rawValue]
        let price = dict[Key.price.rawValue]
        let id = dict[Key.id.rawValue]
        let height = dict[Key.height.rawValue]
        let weight = dict[Key.weight.rawValue]
        
        guard let arr = dict[Key.pics.rawValue] as?  [String]  else { return nil }
       
        return VerticalPaintsModel(
            id: id as? Int ?? 0,
            pic: arr.first ?? "",
            name: title as? String ?? "",
            size: "\(height as? Int ?? 0) x \(weight as? Int ?? 0)",
            price: "\(Currency.currency(price: price as? Int ?? 0)) ₽",
            height: height as? Int ?? 0,
            width: weight as? Int ?? 0
        ) as? T
    }
}
