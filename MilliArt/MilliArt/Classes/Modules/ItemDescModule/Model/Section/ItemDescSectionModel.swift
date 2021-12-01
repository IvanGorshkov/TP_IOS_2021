//
//  ItemDescSectionModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import Foundation

final class ItemDescSectionModel: SectionRowsRepresentable {
    var rows: [CellIdentifiable]

    weak var delegate: ItemDescCellViewOutput?

    init(_ itemDesc: ItemDescModel, inCart: (isSelected: Bool, isRent: Bool)) {
        rows = [CellIdentifiable]()
        rows.append(ItemDescNameCellModel(itemDesc))
        rows.append(SliderCellModel(itemDesc, action: { [weak self] imageSlideshow in
            self?.delegate?.openFullScreen(silder: imageSlideshow)
        }))
        rows.append(AmountDescCellModel(itemDesc, action: { [weak self] in self?.delegate?.openPicker() }))
        rows.append(ButtonsDescModelCell(
            itemDesc,
            actionAR: { [weak self] in self?.delegate?.clickAR() },
            actionBuy: { [weak self] selected in self?.delegate?.clickBuy(selected: selected) },
            actionRent: { [weak self] selected in self?.delegate?.clickRent(selected: selected) },
            actionFav: { [weak self] in  self?.delegate?.clickFav() }, inCart: inCart, isAvalible: itemDesc.isAvalible
            )
        )
      
        if !itemDesc.description.isEmpty {
            rows.append(AboutDescCellModel(itemDesc))
        }
        
        itemDesc.specifications.forEach { [weak self] in
            self?.rows.append(SpecificationsDescCellModel($0))
        }
    }
}
