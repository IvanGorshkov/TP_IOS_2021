//
//  AuthorModel.swift
//  MilliArt
//
//  Created by Alekhin Sergey on 05.11.2021.
//

import Firebase

struct AuthorModel {
    let authorPicture: String
    let authorName: String
    let height: Int
    let width: Int
}

final class AuthorConverter: ConverterDescription {
    enum Key: String {
        case id
        case pic
        case fullname
        case height
        case width
    }
    
    func product<T>(from document: DocumentSnapshot) -> T? {
        guard let dict = document.data() else { return nil }
        let title = dict[Key.fullname.rawValue]
        let height = dict[Key.height.rawValue]
        let width = dict[Key.width.rawValue]
        let pic = dict[Key.pic.rawValue]
        
        return AuthorModel(
            authorPicture: pic as? String ?? "",
            authorName: title as? String ?? "",
            height: height as? Int ?? 0,
            width: width as? Int ?? 0) as? T
    }
}
