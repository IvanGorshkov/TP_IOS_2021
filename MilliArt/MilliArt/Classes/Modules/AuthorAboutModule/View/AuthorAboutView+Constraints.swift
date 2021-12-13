//
//  AuthorAboutView+Constraints.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 05.12.2021.
//

import UIKit

extension AuthorAboutViewController {
    func addViewConstraints() {
        picture.translatesAutoresizingMaskIntoConstraints = false
        fullname.translatesAutoresizingMaskIntoConstraints = false
        interfaceSegmented.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        picture.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        picture.widthAnchor.constraint(equalToConstant: 100).isActive = true
        picture.heightAnchor.constraint(equalToConstant: 100).isActive = true
        picture.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        fullname.topAnchor.constraint(equalTo: picture.bottomAnchor, constant: 10).isActive = true
        fullname.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        fullname.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
       
        interfaceSegmented.translatesAutoresizingMaskIntoConstraints = false
        
        interfaceSegmented.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        interfaceSegmented.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        interfaceSegmented.heightAnchor.constraint(equalToConstant: 30).isActive = true
        interfaceSegmented.topAnchor.constraint(equalTo: self.fullname.bottomAnchor, constant: 10).isActive = true
        
        textView.topAnchor.constraint(equalTo: interfaceSegmented.bottomAnchor, constant: 10).isActive = true
        textView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        textView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        textView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
