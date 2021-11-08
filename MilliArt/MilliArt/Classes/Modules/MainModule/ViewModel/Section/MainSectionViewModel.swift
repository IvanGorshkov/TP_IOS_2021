//
//  MainSectionViewModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 04.11.2021.
//

import Foundation

final class MainSectionViewModel: SectionRowsRepresentable {
    var rows: [CellIdentifiable]
    var actions: TableViewCellOutput?

    init(newPaints: [VerticalPaintsModel], compilations: [CompilationModel], authors: [AuthorModel]) {
        rows = [CellIdentifiable]()
        rows.append(HeaderCellViewModel(title: TitlesConstants.CompilationTitle, action: {
            self.actions?.clickAllCompilation()
        }))
        rows.append(
            HCollectionViewModel(array: compilations.map({ model in
            return HorizontalViewModel(pic: model.compilationPicture, name: model.compilationname)
                }
            ), action: nil)
        )

        rows.append(HeaderCellViewModel(title: TitlesConstants.authorsTitle, action: {
            self.actions?.clickAllAuthor()
        }))

        rows.append(
            HCollectionViewModel(array: authors.map({ model in
            return HorizontalViewModel(pic: model.authorPicture, name: model.authorName)
                }
            ), action: nil)
        )

        rows.append(HeaderCellViewModel(title: TitlesConstants.newTitle, action: nil))
        rows.append(VCollectionViewModel(action: { [weak self] index in
            self?.actions?.clickOnArt(with: index)
        }, newPaints: newPaints))
    }
}
