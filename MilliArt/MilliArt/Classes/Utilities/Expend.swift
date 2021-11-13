//
//  Expend.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 13.11.2021.
//

import Foundation

protocol ExpandeDescription {
    var model: [CartSectionViewModel] { get set }
    func isBasketEmpty() -> Bool
    func getCell(section: Int, row: Int) -> CellIdentifiable?
    func getSection(section: Int) -> CellIdentifiable?
    func getCellIdentifier(section: Int, row: Int) -> String
    func getSectionIdentifier(section: Int) -> String
    func getCountCells(section: Int) -> Int
    func getCountSection() -> Int
    func isExpandable(section: Int) -> Bool
    func expandifNeeded(complition: (Int) -> Void)
}

class ExpandePresenter: ExpandeDescription {
    var model = [CartSectionViewModel]()
    
    func expandifNeeded(complition: (Int) -> Void) {
        for item in (0..<model.count) where model[item].isExpandable {
            complition(item)
        }
    }
    
    func isExpandable(section: Int) -> Bool {
        if model.isEmpty {
            return false
        }
        return model[section].isExpandable
    }
    
    func getCell(section: Int, row: Int) -> CellIdentifiable? {
        if model[section].isExpandable == true {
            return model[section].rows[row - 1]
        }
        return model[section].rows[row]
    }
    
    func getSection(section: Int) -> CellIdentifiable? {
        return model[section]
    }
    
    func getCellIdentifier(section: Int, row: Int) -> String {
        if model[section].isExpandable == true {
            return model[section].rows[row - 1].cellIdentifier
        }
        return model[section].rows[row].cellIdentifier
    }
    
    func getSectionIdentifier(section: Int) -> String {
        return model[section].cellIdentifier
    }
    
    func getCountCells(section: Int) -> Int {
        if model.isEmpty {
            return 0
        }
        if model[section].isExpandable == true {
            return model[section].rows.count + 1
        }
        return model[section].rows.count
    }
    
    func getCountSection() -> Int {
        return model.count
    }

    func isBasketEmpty() -> Bool {
        return model.isEmpty
    }
}
