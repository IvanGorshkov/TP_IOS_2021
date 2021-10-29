//
//  ItemDescSectionModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import Foundation

class ItemDescSectionModel: SectionRowsRepresentable {
    var rows: [CellIdentifiable]
    
    init(_ itemDesc: ItemDescModel) {
        rows = [CellIdentifiable]()
        rows.append(ItemDescNameCellModel(itemDesc))
        rows.append(SliderCellModel(itemDesc))
        rows.append(AmountDescCellModel(itemDesc))
        rows.append(ButtonsDescModelCell(itemDesc))
        rows.append(AboutDescCellModel(itemDesc))
        itemDesc.specifications.forEach { [weak self] in
            self?.rows.append(SpecificationsDescCellModel($0))
        }
    }
}
