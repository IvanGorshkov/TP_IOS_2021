//
//  SearchInteractor.swift
//  MilliArt
//
//  Created by Alekhin Sergey on 28.10.2021.
//  
//

import Foundation

final class SearchInteractor: NetServiceOutput {
    weak var output: SearchInteractorOutput?
    private var totalPainingsArray = [VerticalPaintsModel]()
    private var filterPainingsArray = [VerticalPaintsModel]()
    private var searchServiceManager: NetServiceInput?
    
    func receiveFromService<T>(data: [T]) {
        if let data = data as? [VerticalPaintsModel] {
            totalPainingsArray = data
            self.output?.receiveData(data: data)
        }
    }
    
    func didFail(with error: Error) {
        print("Все плохо")
    }
    
    init() {
        self.searchServiceManager = BaseNetService(interactor: self, collection: "paintings")
        self.searchServiceManager?.productConverter = ArtConverter()
    }
}

extension SearchInteractor: SearchInteractorInput {
    func receiveId(with index: Int) -> Int {
        if filterPainingsArray.isEmpty {
            return totalPainingsArray[index].id
        }
        
        return filterPainingsArray[index].id
    }
    
    func loadData() {
        searchServiceManager?.requestToNetService()
    }
    
    func enterText(text: String) {
        filterPainingsArray = totalPainingsArray.filter { data in
           return data.name.starts(with: text)
        }
        self.output?.receiveData(data: filterPainingsArray)
    }
}
