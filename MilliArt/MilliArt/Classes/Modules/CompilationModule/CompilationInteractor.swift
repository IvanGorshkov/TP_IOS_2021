//
//  CompilationInteractor.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 01.12.2021.
//  
//

import Foundation

final class CompilationInteractor {
    private var array = [VerticalPaintsModel]()
    func didFail(with error: Error) {
        print(error.localizedDescription)
    }
    
	weak var output: CompilationInteractorOutput?
    private var compilationServiceManager: NetServiceWithIdInput?
    
    init() {
        self.compilationServiceManager = CompilationNetService(interactor: self, collection: "paintings", id: "collectionId")
        self.compilationServiceManager?.productConverter = ArtConverter()
    }
}

extension CompilationInteractor: CompilationInteractorInput {
    func receiveId(with index: Int) -> Int {
        return array[index].id
    }
    
    func loadData(with id: Int) {
        compilationServiceManager?.requestToNetService(with: id)
    }
}

extension CompilationInteractor: NetServiceOutput {
    func receiveFromService<T>(data: [T]) {
        guard let data = data as? [VerticalPaintsModel] else { return }
        array = data
        output?.receiveData(data: data)
    }
}
