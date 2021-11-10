//
//  DataManger.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 10.11.2021.
//

import Foundation
import CoreData

protocol DataManagerDescription {
    func initCoreData(complition: @escaping () -> Void)
    func fetch<T>(with request: NSFetchRequest<T>) -> [T]?
    func create<T: NSManagedObject>(with entityName: String, configBlock: (T) -> Void)
    func delete<T: NSManagedObject>(with entityName: String, configBlock: () -> NSFetchRequest<T>)
}

class DataManager: DataManagerDescription {
    private let modelName = "MilliArtModel"
    static let shared = DataManager()
    private let storeContainer: NSPersistentContainer
    var mainQueueContext: NSManagedObjectContext {
        return storeContainer.viewContext
    }
    
    private init() {
        self.storeContainer = NSPersistentContainer(name: modelName)
    }
    
    func initCoreData(complition: @escaping () -> Void) {
        storeContainer.loadPersistentStores { _, err in
            if let err = err {
                fatalError(err.localizedDescription)
            }
            complition()
        }
    }
    
    func fetch<T>(with request: NSFetchRequest<T>) -> [T]? {
        return try? storeContainer.viewContext.fetch(request)
    }
    
    func create<T>(with entityName: String, configBlock: (T) -> Void) where T: NSManagedObject {
        guard let obj = NSEntityDescription.insertNewObject(forEntityName: entityName, into: storeContainer.viewContext) as? T else { return }
        
        configBlock(obj)
        
        try? storeContainer.viewContext.save()
    }
    
    func delete<T>(with entityName: String, configBlock: () -> NSFetchRequest<T>) where T: NSManagedObject {
        let request = configBlock()
        let objects = fetch(with: request)
        guard let objects = objects else { return }
        for obj in objects {
            storeContainer.viewContext.delete(obj)
        }
        
        try? storeContainer.viewContext.save()
    }
}
