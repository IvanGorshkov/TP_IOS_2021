//
//  MainSectionViewModel.swift
//  MilliArt
//
//  Created by Alekhin Sergey on 04.11.2021.
//

import Foundation

final class MainSectionViewModel: SectionRowsRepresentable {
    var rows: [CellIdentifiable]
    var actions: TableViewCellOutput?
    
    func fillData(newPaints: [VerticalPaintsModel], compilations: [CompilationModel], authors: [AuthorModel]) {
        rows.insert(
            HCollectionViewModel(array: compilations.map({ model in
                return HorizontalViewModel(pic: model.compilationPicture, name: model.compilationname, height: model.height, width: model.width, id: model.id)
            }), action: { [weak self] index in
                self?.actions?.clickOnCompilation(with: index)
            }), at: 1)
        
        rows.insert(
            HCollectionViewModel(array: authors.map({ model in
                return HorizontalViewModel(pic: model.authorPicture, name: model.authorName, height: model.height, width: model.width, id: model.id)
                }
            ), action: { [weak self] index in
                self?.actions?.clickOnAuthor(with: index)
            }), at: 3)
    
        rows.append(VCollectionViewModel(action: { [weak self] index in
            self?.actions?.clickOnArt(with: index)
        }, newPaints: newPaints))
    }
    
    init() {
        rows = [CellIdentifiable]()
        rows.append(HeaderCellViewModel(title: TitlesConstants.CompilationTitle, action: {
            self.actions?.clickAllCompilation()
        }))
        
        rows.append(HeaderCellViewModel(title: TitlesConstants.authorsTitle, action: {
            self.actions?.clickAllAuthor()
        }))

        rows.append(HeaderCellViewModel(title: TitlesConstants.newTitle, action: nil))
    }
}
