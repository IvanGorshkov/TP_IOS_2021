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
    private var actualCollectionServiceInput: NetServiceInput?
    
    init() {
        self.actualCollectionServiceInput = BaseNetService(interactor: self, collection: "collection")
        self.actualCollectionServiceInput?.productConverter = CompilationConverter()
    }
}

extension AllCompilationsInteractor: AllInteractorInput {
    func receiveId(with index: Int) -> Int {
        return newCompilations[index].id
    }
    
    func receiveTitle(with index: Int) -> String {
        return newCompilations[index].compilationname
    }
    
    func getTitle() -> String {
        return TitlesConstants.CompilationTitle
    }

    func loadData() {
        actualCollectionServiceInput?.requestToNetService()
    }
}

extension AllCompilationsInteractor: NetServiceOutput {
    func receiveFromService<T>(data: [T]) {
        guard let data = data as? [CompilationModel] else { return }
        self.newCompilations = data
        output?.receiveData(data: newCompilations.map({ model in
            return HorizontalViewModel(pic: model.compilationPicture, name: model.compilationname, height: model.height, width: model.width, id: model.id)
            }
        ))
    }
    
    func didFail(with error: Error) {
        print(error.localizedDescription)
    }
}
