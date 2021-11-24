//
//  ActualCollectionService.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 18.11.2021.
//

import Foundation
import Firebase

final class ActualCollectionService: NewPaintingsServiceInput {
    func getNewPaining() {
        database.collection("collection").addSnapshotListener { [weak self] querySnapshot, error in
            if let error = error {
                self?.output?.didFail(with: error)
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                self?.output?.didFail(with: NetworkError.unexpected)
                return
            }
            
            let products = documents.compactMap { self?.productConverter.product(from: $0) }
            
            self?.output?.receivenewPaints(newCompilations: products)
        }
    }
    
    private let database = Firestore.firestore()
    private let productConverter = ProductConverter()
    weak var output: ActualCollectionServiceOutput?
    init(interactor: ActualCollectionServiceOutput?) {
        output = interactor
    }
}

private final class ProductConverter {
    enum Key: String {
        case id
        case collectionPic
        case collectionName
        case height
        case width
    }
    
    func product(from document: DocumentSnapshot) -> CompilationModel? {
        guard let dict = document.data() else { return nil }
        let title = dict[Key.collectionName.rawValue]
        let height = dict[Key.height.rawValue]
        let width = dict[Key.width.rawValue]
        let pic = dict[Key.collectionPic.rawValue]
        
        return CompilationModel(
            compilationPicture: pic as? String ?? "",
            compilationname: title as? String ?? "",
            height: height as? Int ?? 0,
            width: width as? Int ?? 0)
    }
}
