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
    private var serviceManagerActualCollection: NewPaintingsServiceInput?
    private var serviceManagerActualAuthor: NewPaintingsServiceInput?
    private var verticalPaintsModel = [VerticalPaintsModel]()
    private var newCompilations = [CompilationModel]()
    private var authorModelArr = [AuthorModel]()
    
    init() {
        self.serviceManagerNewPaintings = NewPaintingsService(interactor: self)
        self.serviceManagerActualCollection = ActualCollectionService(interactor: self)
        self.serviceManagerActualAuthor = ActualAuthorService(interactor: self)
    }
    
	weak var output: MainInteractorOutput?
}

extension MainInteractor: MainInteractorInput {
    func receiveId(with index: Int) -> Int {
        return verticalPaintsModel[index].id
    }
    
    func loadData() {
        NotificationCenter.default.post(name: NSNotification.Name("cart"), object: nil)
        serviceManagerNewPaintings?.getNewPaining()
    }
}

extension MainInteractor: NewPaintingsServiceOutput {
    func receivenewPaints(newPaints: [VerticalPaintsModel]) {
        verticalPaintsModel = newPaints
        serviceManagerActualCollection?.getNewPaining()
    }

    func didFail(with error: Error) {
        print(error.localizedDescription)
    }
}

extension MainInteractor: ActualCollectionServiceOutput {
    func receivenewPaints(newCompilations: [CompilationModel]) {
        self.newCompilations = newCompilations
        serviceManagerActualAuthor?.getNewPaining()
    }
}

extension MainInteractor: ActualAuthorServiceOutput {
    func receivenewPaints(authors: [AuthorModel]) {
        self.authorModelArr = authors
        output?.receiveData(newPaints: verticalPaintsModel, compilations: newCompilations, authors: authorModelArr)
    }
}
