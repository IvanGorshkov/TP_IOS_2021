//
//  MainSectionViewModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 04.11.2021.
//

import Foundation

final class MainSectionViewModel: SectionRowsRepresentable {
    var rows: [CellIdentifiable]
    
    var delegate: ItemDescCellViewOutput?
    
    init() {
        rows = [CellIdentifiable]()
        rows.append(HeaderCellModel(title: "Подборки", action: {
            print("OK")
        }))
        
        rows.append(HCollectionViewModel(action: nil))
        rows.append(HeaderCellModel(title: "Авторы", action: {
            print("OK")
        }))
        rows.append(HCollectionViewModel(action: nil))
        rows.append(HeaderCellModel(title: "Новое", action: nil))
        rows.append(VCollectionViewModel(action: nil))
    }
}
