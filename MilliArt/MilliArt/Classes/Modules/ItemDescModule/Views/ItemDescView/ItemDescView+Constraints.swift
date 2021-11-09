//
//  ItemDescView+Constraints.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import UIKit

extension ItemDescViewController {
    internal func addConstraintTableView() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.tableView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor).isActive = true
        self.tableView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor).isActive = true
    }

    internal func addConstraintPickerView() {
        self.pickerView.translatesAutoresizingMaskIntoConstraints = false
        self.pickerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        self.pickerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        self.pickerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true
        self.pickerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
