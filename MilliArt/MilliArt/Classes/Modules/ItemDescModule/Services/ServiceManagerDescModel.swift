//
//  ServiceManagerDescModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import Foundation
import Firebase

enum NetworkError: Error {
    case unexpected
    case faildToParse
}

final class FireBaseServiceManagerDescModel: ServiceManagerDescModelInput {
    private let database = Firestore.firestore()
    private let productConverter = ProductConverter()
    
    func loadItemById(with id: Int) {
        database.collection("paintings").whereField("id", isEqualTo: id).addSnapshotListener { [weak self] querySnapshot, error in
            if let error = error {
                self?.output?.didFail(with: error)
                return
            }
            
            guard let document = querySnapshot?.documents.first else {
                self?.output?.didFail(with: NetworkError.unexpected)
                return
            }
            
            guard let item = self?.productConverter.product(from: document) else {
                self?.output?.didFail(with: NetworkError.faildToParse)
                return
            }
            
            self?.output?.itemDidLoad(itemDesc: item)
        }
    }
    
    weak var output: ServiceManagerDescModelOutput?
    init(interactor: ServiceManagerDescModelOutput?) {
        output = interactor
    }
}

private final class ProductConverter {
    enum Key: String {
        case description
        case name
        case rentPrice
        case id
        case price
        case pics
        case specification
    }
    
    func product(from document: DocumentSnapshot) -> ItemDescModel? {
        guard let dict = document.data() else { return nil }
        let title = dict[Key.name.rawValue]
        let price = dict[Key.price.rawValue]
        let rent = dict[Key.rentPrice.rawValue]
        let about = dict[Key.description.rawValue]
        let id = dict[Key.id.rawValue]
        guard let arr = dict[Key.pics.rawValue] as?  [String]  else { return nil }
        var specifications = [Specifications]()
        guard  let specificationsDict = dict[Key.specification.rawValue] as? NSMutableDictionary  else { return nil }
       
        for d in specificationsDict {
            specifications.append(Specifications(title: d.key as? String ?? "0", specification: d.value as? String ?? "0"))
        }
        
        return ItemDescModel(
            id: id as? Int ?? 0,
            name: title as? String ?? "0",
            author: "Хардкод",
            vendorСode: "Хардкод",
            pictures: arr,
            amount: price as? Int ?? 0,
            rent: rent as? Int ?? 0,
            description: about as? String ?? "",
            specifications: specifications,
            countRent: 1
        )
    }
}
