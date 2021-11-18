//
//  NewPaintingsService.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 18.11.2021.
//

import Foundation
import Firebase

final class NewPaintingsService: NewPaintingsServiceInput {
    func getNewPaining() {
        database.collection("paintings").addSnapshotListener { [weak self] querySnapshot, error in
            if let error = error {
                self?.output?.didFail(with: error)
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                self?.output?.didFail(with: NetworkError.unexpected)
                return
            }
            
            let products = documents.compactMap { self?.productConverter.product(from: $0) }
            
            self?.output?.receivenewPaints(newPaints: products)
        }
    }
    
    private let database = Firestore.firestore()
    private let productConverter = ProductConverter()
    weak var output: NewPaintingsServiceOutput?
    init(interactor: NewPaintingsServiceOutput?) {
        output = interactor
    }
}

private final class ProductConverter {
    enum Key: String {
        case name
        case id
        case price
        case pics
        case specification
        case height
        case weight
    }
    
    func product(from document: DocumentSnapshot) -> VerticalPaintsModel? {
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
            price: "\(price as? Int ?? 0)")
    }
}
