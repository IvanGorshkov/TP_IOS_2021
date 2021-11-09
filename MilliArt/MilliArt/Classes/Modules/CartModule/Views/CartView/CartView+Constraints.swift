//
//  CartViewController.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import UIKit

extension CartViewController {
    func addViewConstraints() {
        self.emptyCartView.translatesAutoresizingMaskIntoConstraints = false
        self.emptyCartView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.emptyCartView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.emptyCartView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.emptyCartView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        self.continueBtn.translatesAutoresizingMaskIntoConstraints = false
        self.continueBtn.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        self.continueBtn.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.continueBtn.heightAnchor.constraint(equalToConstant: 35).isActive = true
        self.continueBtn.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
