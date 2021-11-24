//
//  AllAuthorsInteractor.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 05.11.2021.
//  
//

import Foundation

final class AllAuthorsInteractor {
	weak var output: AllInteractorOutput?
    private var authors = [AuthorModel]()
    private var serviceManagerActualAuthor: NetServiceInput?
    
    init() {
        self.serviceManagerActualAuthor = BaseNetService(interactor: self, collection: "author")
        self.serviceManagerActualAuthor?.productConverter = AuthorConverter()
    }
}

extension AllAuthorsInteractor: AllInteractorInput {
    func getTitle() -> String {
        return TitlesConstants.authorsTitle
    }

    func loadData() {
        serviceManagerActualAuthor?.requestToNetService()
    }
}

extension AllAuthorsInteractor: NetServiceOutput {
    func receiveFromService<T>(data: [T]) {
        guard let data = data as? [AuthorModel] else { return }
        self.authors = data
        output?.receiveData(data: authors.map({ model in
            return HorizontalViewModel(pic: model.authorPicture, name: model.authorName, height: model.height, width: model.width)
            }
        ))
    }
    
    func didFail(with error: Error) {
        print(error.localizedDescription)
    }
    
    func receivenewPaints(authors: [AuthorModel]) {
        self.authors = authors
        output?.receiveData(data: authors.map({ model in
            return HorizontalViewModel(pic: model.authorPicture, name: model.authorName, height: model.height, width: model.width)
            }
        ))
    }
}
