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
    
    private var serviceManagerNewPaintings: NetServiceInput?
    private var serviceManagerActualCollection: NetServiceInput?
    private var serviceManagerActualAuthor: NetServiceInput?
    
    private var verticalPaintsModel = [VerticalPaintsModel]()
    private var newCompilations = [CompilationModel]()
    private var authorModelArr = [AuthorModel]()
    
    private let group = DispatchGroup()

    init() {
        self.serviceManagerNewPaintings = BaseNetService(interactor: self, collection: "paintings")
        self.serviceManagerNewPaintings?.productConverter = ArtConverter()
        
        self.serviceManagerActualCollection = BaseNetService(interactor: self, collection: "collection")
        self.serviceManagerActualCollection?.productConverter = CompilationConverter()
        self.serviceManagerActualCollection?.itemLimit = 10
        
        self.serviceManagerActualAuthor = BaseNetService(interactor: self, collection: "author")
        self.serviceManagerActualAuthor?.productConverter = AuthorConverter()
        self.serviceManagerActualAuthor?.itemLimit = 10
    }
}

extension MainInteractor: MainInteractorInput {
    func receiveId(with index: Int) -> Int {
        return verticalPaintsModel[index].id
    }
    
    func loadData() {
        NotificationCenter.default.post(name: NSNotification.Name("cart"), object: nil)
        group.enter()
        DispatchQueue.global(qos: .userInitiated).async { [self] in
            serviceManagerNewPaintings?.requestToNetService()
        }
        group.enter()
        DispatchQueue.global(qos: .userInitiated).async { [self] in
            serviceManagerActualAuthor?.requestToNetService()
        }
        group.enter()
        DispatchQueue.global(qos: .userInitiated).async { [self] in
            serviceManagerActualCollection?.requestToNetService()
        }
        
        group.notify(queue: .main, execute: { [self] in
            output?.receiveData(newPaints: verticalPaintsModel, compilations: newCompilations, authors: authorModelArr)
        })
    }
}

extension MainInteractor: NetServiceOutput {
    func receiveFromService<T>(data: [T]) {
        self.group.leave()
        if let data = data as? [VerticalPaintsModel] {
            self.verticalPaintsModel = data
        }
        
        if let data = data as? [CompilationModel] {
            self.newCompilations = data
        }
        
        if let data = data as? [AuthorModel] {
            self.authorModelArr = data
        }
    }
    
    func didFail(with error: Error) {
        self.group.leave()
        print(error.localizedDescription)
    }
}
