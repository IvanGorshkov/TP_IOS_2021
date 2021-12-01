//
//  OrderViewController.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 12.11.2021.
//  
//

import UIKit

extension OrderViewController {
    func addViewConstraints() {
        thanksLabel.translatesAutoresizingMaskIntoConstraints = false
        self.thanksLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        self.thanksLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.thanksLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        numberOrderLabel.translatesAutoresizingMaskIntoConstraints = false
        self.numberOrderLabel.topAnchor.constraint(equalTo: self.thanksLabel.bottomAnchor, constant: 5).isActive = true
        self.numberOrderLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.numberOrderLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.topAnchor.constraint(equalTo: self.numberOrderLabel.bottomAnchor, constant: 5).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
}
