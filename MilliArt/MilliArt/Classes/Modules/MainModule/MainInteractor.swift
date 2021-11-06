//
//  MainInteractor.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import Foundation

final class MainInteractor {
	weak var output: MainInteractorOutput?
    let arr1 = [
        CompilationModel(compilationPicture: "pic1", compilationname: "На гребне волны"),
        CompilationModel(compilationPicture: "pic2", compilationname: "Белые утесы"),
        CompilationModel(compilationPicture: "pic3", compilationname: "Гончии")
    ]

    let arr2 = [
        AuthorModel(authorPicture: "pic4", authorName: "Любовь Харламова"),
        AuthorModel(authorPicture: "pic5", authorName: "Наталья Вильвовская"),
        AuthorModel(authorPicture: "pic6", authorName: "Антон Кетов")
    ]
    let arr3 = [
        VerticalPaintsModel(pic: "korzev", name: "Следы войны", size: "20 x 100", price: "120394 ₽"),
        VerticalPaintsModel(pic: "pic1", name: "На гребне волны", size: "200 x 100", price: "120394 ₽"),
        VerticalPaintsModel(pic: "pic2", name: "Белые утесы", size: "200 x 10", price: "120394 ₽"),
        VerticalPaintsModel(pic: "pic3", name: "Гончии", size: "200 x 100", price: "120394 ₽"),
        VerticalPaintsModel(pic: "Pushkin", name: "Портрет Пушкина", size: "20 x 100", price: "120394 ₽"),
        VerticalPaintsModel(pic: "sidorov", name: "Зимня дорога Версты", size: "20 x 100", price: "120394 ₽"),
        VerticalPaintsModel(pic: "sidorov", name: "Зимняя дорога. Версты  дорога Версты", size: "200 x 100", price: "120394 ₽"),
        VerticalPaintsModel(pic: "Pushkin", name: "Портрет Пушкина", size: "200 x 100", price: "120394 ₽"),
        VerticalPaintsModel(pic: "pic3", name: "Гончии", size: "200 x 100", price: "120394 ₽"),
        VerticalPaintsModel(pic: "pic2", name: "Белые утесы", size: "200 x 100", price: "120394 ₽"),
        VerticalPaintsModel(pic: "pic1", name: "На гребне волны", size: "200 x 100", price: "120394 ₽"),
        VerticalPaintsModel(pic: "korzev", name: "Следы войны", size: "200 x 100", price: "120394 ₽")
    ]
}

extension MainInteractor: MainInteractorInput {
    func loadData() {
        output?.receiveData(newPaints: arr3, compilations: arr1, authors: arr2)
    }
}
