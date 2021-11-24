//
//  ActualCollectionService.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 18.11.2021.
//

import Foundation
import Firebase

final class BaseNetService: NetServiceInput {
    var itemLimit: Int
    
    func requestToNetService() {
        database.collection(collection).limit(to: itemLimit).getDocuments { [weak self] querySnapshot, error in
            if let error = error {
                self?.output?.didFail(with: error)
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                self?.output?.didFail(with: NetworkError.unexpected)
                return
            }
            
            let products = documents.compactMap { [weak self] snapshot in
                return self?.productConverter?.product(from: snapshot) as Any
            }
            
            self?.output?.receiveFromService(data: products)
        }
    }
    
    private let database = Firestore.firestore()
    var productConverter: ConverterDescription?
    private let collection: String
    
    weak var output: NetServiceOutput?
    init(interactor: NetServiceOutput?, collection: String) {
        output = interactor
        itemLimit = Int.max
        self.collection = collection
    }
}
