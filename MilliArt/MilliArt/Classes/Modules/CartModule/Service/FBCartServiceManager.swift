//
//  FBCartServiceManager.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 18.11.2021.
//

import Foundation
import Firebase

final class FBCartServiceManager {
    private let database = Firestore.firestore()
    private let productConverter = ProductConverter()
    weak var output: ServiceCartModelOutput?
    
    init(interactor: ServiceCartModelOutput?) {
        output = interactor
    }
}
extension FBCartServiceManager: ServiceCartModelInput {
    func loadItemsByIds(with ids: [Int]) {
        if ids.isEmpty {
            self.output?.itemDidLoad(baseCarts: [])
            return
        }
        database.collection("paintings").whereField("id", in: ids).addSnapshotListener { [weak self] querySnapshot, error in
            if let error = error {
                self?.output?.didFail(with: error)
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                self?.output?.didFail(with: NetworkError.unexpected)
                return
            }
            
            self?.productConverter.getAllData(from: documents, complition: { arr in
                self?.output?.itemDidLoad(baseCarts: arr)
            })
        }
    }
}

private final class ProductConverter {
    enum Key: String {
        case name
        case id
        case pics
        case vendor
        case authorId
        case fullname
    }
    
    func getAllData(from document: [DocumentSnapshot], complition: @escaping ([BaseCart]) -> Void) {
        var arr = [BaseCart]()
        var i = 0
        for item in document {
            product(from: item) { base in
                arr.append(base)
                i += 1
                if i == document.count {
                    complition(arr)
                }
            }
        }
    }
    
    func product(from document: DocumentSnapshot, complition: @escaping (BaseCart) -> Void) {
        guard let dict = document.data() else { return }
        let title = dict[Key.name.rawValue]
        let id = dict[Key.id.rawValue]
        let vendor = dict[Key.vendor.rawValue]
        guard let arr = dict[Key.pics.rawValue] as?  [String]  else { return }
        let database = Firestore.firestore()
        database.collection("author").whereField("id", isEqualTo: dict[Key.authorId.rawValue] as? Int ??  0).getDocuments { querySnapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = querySnapshot?.documents.first?.data() else {
                return
            }
            
            complition(BaseCart(
                id: id as? Int ?? 0,
                img: arr.first ?? "0",
                name: title as? String ?? "0",
                auther: data[Key.fullname.rawValue] as? String ?? "0",
                artical: vendor as? String ?? "0"))
        }
    }
}
