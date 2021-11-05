//
//  AllCompilationsInteractor.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 05.11.2021.
//  
//

import Foundation

final class AllCompilationsInteractor {
	weak var output: AllInteractorOutput?
}

extension AllCompilationsInteractor: AllInteractorInput {
    func getTitle() -> String {
        return TitlesConstants.CompilationTitle
    }
    
    func loadData() {
        let arr1 = [
            CompilationModel(compilationPicture: "pic1", compilationname: "На гребне волны"),
            CompilationModel(compilationPicture: "pic2", compilationname: "Белые утесы"),
            CompilationModel(compilationPicture: "pic3", compilationname: "Гончии"),
            CompilationModel(compilationPicture: "pic2", compilationname: "Белые утесы"),
            CompilationModel(compilationPicture: "pic1", compilationname: "На гребне волны"),
            CompilationModel(compilationPicture: "pic3", compilationname: "Гончии"),
            CompilationModel(compilationPicture: "pic2", compilationname: "Белые утесы"),
            CompilationModel(compilationPicture: "pic3", compilationname: "Гончии"),
            CompilationModel(compilationPicture: "pic1", compilationname: "На гребне волны"),
            CompilationModel(compilationPicture: "pic2", compilationname: "Белые утесы"),
            CompilationModel(compilationPicture: "pic1", compilationname: "На гребне волны"),
            CompilationModel(compilationPicture: "pic3", compilationname: "Гончии"),
            CompilationModel(compilationPicture: "pic2", compilationname: "Белые утесы"),
            CompilationModel(compilationPicture: "pic1", compilationname: "На гребне волны"),
            CompilationModel(compilationPicture: "pic3", compilationname: "Гончии"),
            CompilationModel(compilationPicture: "pic2", compilationname: "Белые утесы"),
            CompilationModel(compilationPicture: "pic1", compilationname: "На гребне волны"),
            CompilationModel(compilationPicture: "pic3", compilationname: "Гончии"),
            CompilationModel(compilationPicture: "pic2", compilationname: "Белые утесы"),
            CompilationModel(compilationPicture: "pic3", compilationname: "Гончии"),
            CompilationModel(compilationPicture: "pic2", compilationname: "Белые утесы"),
            CompilationModel(compilationPicture: "pic1", compilationname: "На гребне волны"),
            CompilationModel(compilationPicture: "pic3", compilationname: "Гончии")
        ]
        output?.receiveData(data: arr1.map({ model in
            return HorizontalViewModel(pic: model.compilationPicture, name: model.compilationname)
            }
        ))
    }
    
}
