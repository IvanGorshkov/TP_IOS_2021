//
//  MainInteractor.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import Foundation

final class MainInteractor {
    private var serviceManagerNewPaintings: NewPaintingsServiceInput?
    init() {
        self.serviceManagerNewPaintings = NewPaintingsService(interactor: self)
    }
    
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
        VerticalPaintsModel(id: 0, pic: "korzev", name: "Следы войны", size: "20 x 100", price: "\(Currency.currency(price: 120394)) ₽"),
        VerticalPaintsModel(id: 1, pic: "pic1", name: "На гребне волны", size: "200 x 100", price: "\(Currency.currency(price: 120394)) ₽"),
        VerticalPaintsModel(id: 2, pic: "pic2", name: "Белые утесы", size: "200 x 10", price: "\(Currency.currency(price: 120394)) ₽"),
        VerticalPaintsModel(id: 3, pic: "pic3", name: "Гончии", size: "200 x 100", price: "\(Currency.currency(price: 120394)) ₽"),
        VerticalPaintsModel(id: 4, pic: "Pushkin", name: "Портрет Пушкина", size: "20 x 100", price: "\(Currency.currency(price: 120394)) ₽"),
        VerticalPaintsModel(id: 5, pic: "sidorov", name: "Зимня дорога Версты", size: "20 x 100", price: "\(Currency.currency(price: 120394)) ₽"),
        VerticalPaintsModel(id: 6, pic: "sidorov", name: "дорога. Версты  дорога", size: "200 x 100", price: "\(Currency.currency(price: 120394)) ₽"),
        VerticalPaintsModel(id: 7, pic: "Pushkin", name: "Портрет Пушкина", size: "200 x 100", price: "\(Currency.currency(price: 120394)) ₽"),
        VerticalPaintsModel(id: 8, pic: "pic3", name: "Гончии", size: "200 x 100", price: "\(Currency.currency(price: 120394)) ₽"),
        VerticalPaintsModel(id: 9, pic: "pic2", name: "Белые утесы", size: "200 x 100", price: "\(Currency.currency(price: 120394)) ₽"),
        VerticalPaintsModel(id: 10, pic: "pic1", name: "На гребне волны", size: "200 x 100", price: "\(Currency.currency(price: 120394)) ₽"),
        VerticalPaintsModel(id: 11, pic: "korzev", name: "Следы войны", size: "200 x 100", price: "\(Currency.currency(price: 120394)) ₽")
    ]
}

extension MainInteractor: MainInteractorInput {
    func loadData() {
        NotificationCenter.default.post(name: NSNotification.Name("cart"), object: nil)
        serviceManagerNewPaintings?.getNewPaining()
    }
}

extension MainInteractor: NewPaintingsServiceOutput {
    func receivenewPaints(newPaints: [VerticalPaintsModel]) {
        output?.receiveData(newPaints: newPaints, compilations: arr1, authors: arr2)
    }

    func didFail(with error: Error) {
        print(error.localizedDescription)
    }
}
