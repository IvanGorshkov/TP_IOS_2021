//
//  FullAuthor.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 06.12.2021.
//

import Firebase

enum ProductAvalible {
    case all
    case avalible
}

extension ProductAvalible {
    init(rawValue: Int) {
        switch rawValue {
        case 0: self = .all
        case 1: self = .avalible
        default: self = .all
        }
    }
}

struct FullAuthor {
    let picture: String
    let fullname: String
    let city: String
    let about: String
    let career: String
}

final class FullAuthorConverter: ConverterDescription {
    enum Key: String {
        case pic
        case fullname
        case city
        case about
        case career
    }
    
    func product<T>(from document: DocumentSnapshot) -> T? {
        guard let dict = document.data() else { return nil }
        let title = dict[Key.fullname.rawValue]
        let pic = dict[Key.pic.rawValue]
        let city = dict[Key.city.rawValue]
        let about = dict[Key.about.rawValue]
        let career = dict[Key.career.rawValue]
        
        return FullAuthor(
            picture: pic as? String ?? "",
            fullname: title as? String ?? "",
            city: city as? String ?? "",
            about: about as? String ?? "",
            career: career as? String ?? "") as? T
    }
}
