//
//  ActualAuthorService.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 18.11.2021.
//

import Foundation
import Firebase

final class ActualAuthorService: NewPaintingsServiceInput {
    func getNewPaining() {
        database.collection("author").addSnapshotListener { [weak self] querySnapshot, error in
            if let error = error {
                self?.output?.didFail(with: error)
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                self?.output?.didFail(with: NetworkError.unexpected)
                return
            }
            
            let products = documents.compactMap { self?.productConverter.product(from: $0) }
            
            self?.output?.receivenewPaints(authors: products)
        }
    }
    
    private let database = Firestore.firestore()
    private let productConverter = ProductConverter()
    weak var output: ActualAuthorServiceOutput?
    init(interactor: ActualAuthorServiceOutput?) {
        output = interactor
    }
}

private final class ProductConverter {
    enum Key: String {
        case id
        case pic
        case fullname
    }
    
    func product(from document: DocumentSnapshot) -> AuthorModel? {
        guard let dict = document.data() else { return nil }
        let title = dict[Key.fullname.rawValue]
       //  let _ = dict[Key.id.rawValue]
        let pic = dict[Key.pic.rawValue]
        
        return AuthorModel(authorPicture: pic as? String ?? "", authorName: title as? String ?? "")
    }
}
