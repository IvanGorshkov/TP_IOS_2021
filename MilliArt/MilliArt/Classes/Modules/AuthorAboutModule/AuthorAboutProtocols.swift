//
//  AuthorAboutProtocols.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 12.12.2021.
//  
//

import Foundation

protocol AuthorAboutModuleInput {
	var moduleOutput: AuthorAboutModuleOutput? { get }
}

protocol AuthorAboutModuleOutput: AnyObject {
}

protocol AuthorAboutViewInput: AnyObject {
}

protocol AuthorAboutViewOutput: AnyObject {
    func getImage() -> String
    func getFullName() -> String
    func getText(index: Int) -> String
}

protocol AuthorAboutInteractorInput: AnyObject {
    var author: FullAuthor? { get  set }
    func getImage() -> String
    func getFullName() -> String
    func getText(index: Int) -> String
}

protocol AuthorAboutInteractorOutput: AnyObject {
}

protocol AuthorAboutRouterInput: AnyObject {
}
