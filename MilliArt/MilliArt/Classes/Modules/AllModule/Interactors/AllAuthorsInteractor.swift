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
}

extension AllAuthorsInteractor: AllInteractorInput {
    func getTitle() -> String {
        return TitlesConstants.authorsTitle
    }
    
    func loadData() {
        let arr2 = [
            AuthorModel(authorPicture: "pic4", authorName: "Любовь Харламова"),
            AuthorModel(authorPicture: "pic5", authorName: "Наталья Вильвовская"),
            AuthorModel(authorPicture: "pic6", authorName: "Антон Кетов"),
            AuthorModel(authorPicture: "pic5", authorName: "Наталья Вильвовская"),
            AuthorModel(authorPicture: "pic6", authorName: "Антон Кетов"),
            AuthorModel(authorPicture: "pic4", authorName: "Любовь Харламова"),
            AuthorModel(authorPicture: "pic5", authorName: "Наталья Вильвовская"),
            AuthorModel(authorPicture: "pic6", authorName: "Антон Кетов"),
            AuthorModel(authorPicture: "pic6", authorName: "Антон Кетов"),
            AuthorModel(authorPicture: "pic5", authorName: "Наталья Вильвовская"),
            AuthorModel(authorPicture: "pic6", authorName: "Антон Кетов"),
            AuthorModel(authorPicture: "pic4", authorName: "Любовь Харламова"),
            AuthorModel(authorPicture: "pic5", authorName: "Наталья Вильвовская"),
            AuthorModel(authorPicture: "pic6", authorName: "Антон Кетов"),
            AuthorModel(authorPicture: "pic5", authorName: "Наталья Вильвовская"),
            AuthorModel(authorPicture: "pic6", authorName: "Антон Кетов"),
            AuthorModel(authorPicture: "pic4", authorName: "Любовь Харламова"),
            AuthorModel(authorPicture: "pic5", authorName: "Наталья Вильвовская"),
            AuthorModel(authorPicture: "pic6", authorName: "Антон Кетов"),
            AuthorModel(authorPicture: "pic5", authorName: "Наталья Вильвовская"),
            AuthorModel(authorPicture: "pic6", authorName: "Антон Кетов"),
            AuthorModel(authorPicture: "pic4", authorName: "Любовь Харламова"),
            AuthorModel(authorPicture: "pic5", authorName: "Наталья Вильвовская"),
            AuthorModel(authorPicture: "pic6", authorName: "Антон Кетов")
        ]
        
        output?.receiveData(data: arr2.map({ model in
            return HorizontalViewModel(pic: model.authorPicture, name: model.authorName)
            }
        ))
    }
    
}
