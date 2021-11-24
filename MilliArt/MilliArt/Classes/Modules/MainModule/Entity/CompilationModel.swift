//
//  CompilationModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 05.11.2021.
//

import Firebase

struct CompilationModel {
    let compilationPicture: String
    let compilationname: String
    let height: Int
    let width: Int
}

final class CompilationConverter: ConverterDescription {
    func product<T>(from document: DocumentSnapshot) -> T? {
        guard let dict = document.data() else { return nil }
        let title = dict[Key.collectionName.rawValue]
        let height = dict[Key.height.rawValue]
        let width = dict[Key.width.rawValue]
        let pic = dict[Key.collectionPic.rawValue]
        
        return CompilationModel(
            compilationPicture: pic as? String ?? "",
            compilationname: title as? String ?? "",
            height: height as? Int ?? 0,
            width: width as? Int ?? 0) as? T
    }
    
    enum Key: String {
        case id
        case collectionPic
        case collectionName
        case height
        case width
    }
}
