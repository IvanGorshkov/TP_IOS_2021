//
//  AllCompilationsInteractor.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 05.11.2021.
//  
//

import Foundation

final class AllCompilationsInteractor {
	weak var output: AllInteractorOutput?
    private var newCompilations = [CompilationModel]()
    private var actualCollectionServiceInput: NewPaintingsServiceInput?
    
    init() {
        self.actualCollectionServiceInput = ActualCollectionService(interactor: self)
    }
}

extension AllCompilationsInteractor: AllInteractorInput {
    func getTitle() -> String {
        return TitlesConstants.CompilationTitle
    }

    func loadData() {
        actualCollectionServiceInput?.getNewPaining()
    }
}

extension AllCompilationsInteractor: ActualCollectionServiceOutput {
    func receivenewPaints(newCompilations: [CompilationModel]) {
        self.newCompilations = newCompilations
        output?.receiveData(data: newCompilations.map({ model in
            return HorizontalViewModel(pic: model.compilationPicture, name: model.compilationname, height: model.height, width: model.width)
            }
        ))
    }
    
    func didFail(with error: Error) {
        print(error.localizedDescription)
    }
}
