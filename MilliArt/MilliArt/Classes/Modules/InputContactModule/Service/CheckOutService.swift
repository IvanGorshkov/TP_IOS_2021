//
//  CheckOutService.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 24.11.2021.
//

import Firebase

protocol CheckOutServiceInput: AnyObject {
    func checkout(with rented: [RentPrice], and bought: [BuyPrice], with data: [CheckoutDataModel])
}

protocol CheckOutServiceOutput: AnyObject {
    func faildCheckout()
    func successCheckout(with orederId: Int)
}

final class CheckOutService {
    private let database = Firestore.firestore()
    weak var output: CheckOutServiceOutput?
    
    init(interactor: CheckOutServiceOutput?) {
        output = interactor
    }
}

extension CheckOutService: CheckOutServiceInput {
    func checkout(with rented: [RentPrice], and bought: [BuyPrice], with data: [CheckoutDataModel]) {
        var ids = rented.map({ $0.id })
        ids.append(contentsOf: bought.map({ $0.id }))
        
        var dict = ProductConverter().dict(from: data)
        let orderNumber = Int.random(in: (0...1000000))
        dict["orderNumber"] = orderNumber
        dict["order"] = ids
        database.collection("order").addDocument(data: dict) { [weak self] error in
            if error != nil {
                self?.output?.faildCheckout()
            } else {
                self?.database.collection("paintings").whereField("id", in: ids).getDocuments(completion: { query, _ in
                    guard let documents = query?.documents else { return }
                    
                    documents.forEach { document in
                        document.reference.updateData(["available": false])
                    }
                    self?.output?.successCheckout(with: orderNumber)
                })
            }
        }
    }
}

private final class ProductConverter {
    func dict(from product: [CheckoutDataModel]) -> [String: Any] {
        var data: [String: Any] = [:]
        
        product.forEach { model in
            data[model.inputType.rawValue] = model.text
        }
        return data
    }
}
