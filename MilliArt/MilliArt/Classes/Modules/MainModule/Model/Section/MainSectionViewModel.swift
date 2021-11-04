//
//  MainSectionViewModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 04.11.2021.
//

import Foundation

struct HorizontalModel {
    let pic: String
    let name: String
}


final class MainSectionViewModel: SectionRowsRepresentable {
    var rows: [CellIdentifiable]
    
    var delegate: ItemDescCellViewOutput?
    
    init() {
        let arr1 = [
            HorizontalModel(pic: "pic1", name: "На гребне волны"),
            HorizontalModel(pic: "pic2", name: "Белые утесы"),
            HorizontalModel(pic: "pic3", name: "Гончии")
        ]
        
        let arr2 = [
            HorizontalModel(pic: "pic4", name: "Любовь Харламова"),
            HorizontalModel(pic: "pic5", name: "Наталья Вильвовская"),
            HorizontalModel(pic: "pic6", name: "Антон Кетов")
        ]
        
        rows = [CellIdentifiable]()
        rows.append(HeaderCellModel(title: "Подборки", action: {
            print("OK")
        }))
        
        rows.append(HCollectionViewModel(array: arr1, action: nil))
        rows.append(HeaderCellModel(title: "Авторы", action: {
            print("OK")
        }))
        rows.append(HCollectionViewModel(array: arr2, action: nil))
        rows.append(HeaderCellModel(title: "Новое", action: nil))
        rows.append(VCollectionViewModel(action: nil))
    }
}
