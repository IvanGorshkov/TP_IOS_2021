//
//  HCollectionViewModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 04.11.2021.
//

import Foundation

struct PainingMini {
    let pic: String
    let name: String
    let size: String
    let price: String
}


final class VCollectionViewModel: BaseCellModel {
    typealias ActionHandler = () -> ()
    var action: ActionHandler?
    
    override var cellIdentifier: String {
        return VerticalCollectionViewCell.cellIdentifier
    }
    let array: [PainingMini]
    
    init(action: ActionHandler? = nil) {
        self.action = action
        array = [
            PainingMini(pic: "korzev", name: "Следы войны", size: "200 x 100", price: "120394 р"),
            PainingMini(pic: "pic1", name: "На гребне волны", size: "200 x 100", price: "120394 р"),
            PainingMini(pic: "pic2", name: "Белые утесы", size: "200 x 100", price: "120394 р"),
            PainingMini(pic: "pic3", name: "Гончии", size: "200 x 100", price: "120394 р"),
            PainingMini(pic: "Pushkin", name: "Портрет Пушкина", size: "200 x 100", price: "120394 р"),
            PainingMini(pic: "sidorov", name: "Зимняя дорога. Версты", size: "200 x 100", price: "120394 р"),
            PainingMini(pic: "sidorov", name: "Зимняя дорога. Версты", size: "200 x 100", price: "120394 р"),
            PainingMini(pic: "Pushkin", name: "Портрет Пушкина", size: "200 x 100", price: "120394 р"),
            PainingMini(pic: "pic3", name: "Гончии", size: "200 x 100", price: "120394 р"),
            PainingMini(pic: "pic2", name: "Белые утесы", size: "200 x 100", price: "120394 р"),
            PainingMini(pic: "pic1", name: "На гребне волны", size: "200 x 100", price: "120394 р"),
            PainingMini(pic: "korzev", name: "Следы войны", size: "200 x 100", price: "120394 р"),
        ]
    }
}
