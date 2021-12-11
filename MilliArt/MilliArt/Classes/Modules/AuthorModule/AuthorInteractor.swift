//
//  AuthorInteractor.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 05.12.2021.
//  
//

import Foundation

final class AuthorInteractor: ContextDelegate {
    func reciveData(data: [VerticalPaintsModel]) {
        output?.receiveData(data: data)
    }
    
	weak var output: AuthorInteractorOutput?
    private var fullAuthor: FullAuthor?
    
    private var authorServiceManager: NetServiceWithIdInput?
    private var context = Context(AllState())
    
    init() {
        self.authorServiceManager = CompilationNetService(interactor: self, collection: "author", id: "id")
        self.authorServiceManager?.productConverter = FullAuthorConverter()
        context.delegate = self
    }
}

extension AuthorInteractor: AuthorInteractorInput {
    func getFullAuthor() -> FullAuthor? {
        return fullAuthor
    }
    
    func getMailInfo() -> Mail {
        return Mail(
            to: "privateorder@milliart.com",
            subject: "Частный заказ",
            body: "Частный заказ у \"\(fullAuthor?.fullname ?? "")\"<br/> Опишите свой заказ"
        )
    }
    
    func changeType(with id: Int, type: ProductAvalible) {
        context.change(to: type)
        context.receiveData(with: id)
    }
    
    func receiveId(with index: Int) -> Int {
        return context.receiveId(with: index)
    }
    
    func loadData(with id: Int) {
        context.receiveData(with: id)
        authorServiceManager?.requestToNetService(with: id)
    }
}

extension AuthorInteractor: NetServiceOutput {
    func receiveFromService<T>(data: [T]) {
        if let data = data as? [FullAuthor] {
            fullAuthor = data.first
            guard let fullAuthor = fullAuthor else { return }
            output?.receiveAuthor(author: fullAuthor)
        }
    }
    
    func didFail(with error: Error) {
        print(error.localizedDescription)
    }
}
