//
//  ItemDescModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//

import Foundation

struct ItemDescModel {
    let name: String
    let pictures: [String]
    let amount: Int
    let rent: Int
    let description: String
    let specifications: [Specifications]
    var countRent: Int
}

struct Specifications {
    let title: String
    let specification: String
}
