//
//  ActualCollectionService.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 18.11.2021.
//

import Foundation
import Firebase

final class BaseNetService: NetServiceInput {
    func reset() {
        query = database.collection(collection)
    }
    
    func addSort(param: String, desc: Bool) {
        query = query?.order(by: param, descending: desc)
    }
    
    func addLimit() {
        query = query?.limit(to: itemLimit)
    }
    
    var itemLimit: Int
    private var query: Query?
    
    func requestToNetService() {
        query?.getDocuments { [weak self] querySnapshot, error in
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
        query = database.collection(collection)
    }
}
