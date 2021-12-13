//
//  AuthorAboutInteractor.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 12.12.2021.
//  
//

import Foundation

final class AuthorAboutInteractor {
	weak var output: AuthorAboutInteractorOutput?
    var author: FullAuthor?
}

extension AuthorAboutInteractor: AuthorAboutInteractorInput {
    func getText(index: Int) -> String {
        switch index {
        case 0: return author?.about.replacingOccurrences(of: "\\n", with: "\n") ?? ""
        case 1: return author?.career.replacingOccurrences(of: "\\n", with: "\n") ?? ""
        default: return author?.about.replacingOccurrences(of: "\\n", with: "\n") ?? ""
        }
    }
    
    func getImage() -> String {
        return author?.picture ?? ""
    }
    
    func getFullName() -> String {
        return author?.fullname ?? ""
    }
}
