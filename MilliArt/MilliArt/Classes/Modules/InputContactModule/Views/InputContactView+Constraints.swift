//
//  InputContactView+Constraints.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 11.11.2021.
//
 
import UIKit

extension InputContactViewController {
    internal func addConstraintTableView() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.tableView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        self.continueBtn.translatesAutoresizingMaskIntoConstraints = false
        self.continueBtn.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        self.continueBtn.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.continueBtn.heightAnchor.constraint(equalToConstant: 35).isActive = true
        self.continueBtn.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
