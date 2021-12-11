//
//  ActualCollectionService.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 18.11.2021.
//

import Foundation
import Firebase

final class CompilationNetService: NetServiceWithIdInput {
    func reset() {
        query = database.collection(collection)
    }
    
    func addWhere(query: (Query) -> Query) {
        guard let q = self.query else { return }
        self.query = query(q)
    }
    
    func requestToNetService(with id: Int?) {
        query?.whereField(idParam, isEqualTo: id ?? 0)
            .limit(to: itemLimit)
            .getDocuments { [weak self] querySnapshot, error in
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
    
    var itemLimit: Int
    
    private let database = Firestore.firestore()
    var productConverter: ConverterDescription?
    private let collection: String
    private let idParam: String
    private var query: Query?
    
    weak var output: NetServiceOutput?
    init(interactor: NetServiceOutput?, collection: String, id: String) {
        output = interactor
        itemLimit = Int.max
        self.collection = collection
        self.idParam = id
        query = database.collection(collection)
    }
}
