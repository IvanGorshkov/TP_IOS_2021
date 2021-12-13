//
//  AuthorState.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 07.12.2021.
//

import Foundation

protocol ContextDelegate: AnyObject {
    func reciveData(data: [VerticalPaintsModel])
}

class Context {
    private var state: State
    weak var delegate: ContextDelegate?
    
    fileprivate var array: [VerticalPaintsModel]?
    fileprivate var arrayAvalible: [VerticalPaintsModel]?
    
    init(_ state: State) {
        self.state = state
        transitionTo(state: state)
    }

    private func transitionTo(state: State) {
        self.state = state
        self.state.update(context: self)
    }
    
    func change(to type: ProductAvalible) {
        switch type {
        case .all:
            transitionTo(state: AllState())
        case .avalible:
            transitionTo(state: AvalibleState())
        }
    }
    
    func receiveId(with index: Int) -> Int {
        return state.receiveId(with: index)
    }

    func receiveData(with index: Int) {
        state.receiveData(with: index)
    }
    
    fileprivate func receivingDone(data: [VerticalPaintsModel]) {
        delegate?.reciveData(data: data)
    }
}

protocol State: AnyObject {
    func update(context: Context)
    func receiveId(with index: Int) -> Int
    func receiveData(with index: Int)
    var artsServiceManager: NetServiceWithIdInput? { get set }
}

class BaseState: State {
    var artsServiceManager: NetServiceWithIdInput?
    private(set) weak var context: Context?
    func update(context: Context) {
        self.context = context
    }
    func receiveId(with index: Int) -> Int { return 0 }
    func receiveData(with index: Int) {}
}

class AllState: BaseState {
    override init() {
        super.init()
        self.artsServiceManager = CompilationNetService(interactor: self, collection: "paintings", id: "authorId")
        self.artsServiceManager?.productConverter = ArtConverter()
    }
    
    override func receiveId(with index: Int) -> Int {
        return context?.array?[index].id ?? 0
    }

    override func receiveData(with index: Int) {
        if context?.array != nil {
            context?.receivingDone(data: context?.array ?? [])
            return
        }
        
        artsServiceManager?.requestToNetService(with: index)
    }
}

extension AllState: NetServiceOutput {
    func receiveFromService<T>(data: [T]) {
        if let data = data as? [VerticalPaintsModel] {
            context?.array = data
            context?.receivingDone(data: data)
        }
    }
    
    func didFail(with error: Error) {
        print(error.localizedDescription)
    }
}

class AvalibleState: BaseState {
    override init() {
        super.init()
        self.artsServiceManager = CompilationNetService(interactor: self, collection: "paintings", id: "authorId")
        self.artsServiceManager?.productConverter = ArtConverter()
        artsServiceManager?.addWhere(query: { query in
                return query.whereField("available", isEqualTo: true)
        })
    }
    
    override func receiveId(with index: Int) -> Int {
        return context?.arrayAvalible?[index].id ?? 0
    }

    override func receiveData(with index: Int) {
        if context?.arrayAvalible != nil {
            context?.receivingDone(data: context?.arrayAvalible ?? [])
            return
        }
        
        artsServiceManager?.requestToNetService(with: index)
    }
}

extension AvalibleState: NetServiceOutput {
    func receiveFromService<T>(data: [T]) {
        if let data = data as? [VerticalPaintsModel] {
            context?.arrayAvalible = data
            context?.receivingDone(data: data)
        }
    }
    
    func didFail(with error: Error) {
        print(error.localizedDescription)
    }
}
