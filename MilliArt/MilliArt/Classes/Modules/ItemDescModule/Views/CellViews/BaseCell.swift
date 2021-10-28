//
//  BaseCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import Foundation


import UIKit

class BaseCell: UITableViewCell, ModelRepresentable {
    var model: CellIdentifiable? {
        didSet {
            updateViews()
        }
    }
    
    
    func updateViews() { }
    
    func loadSubViews() { }
}
