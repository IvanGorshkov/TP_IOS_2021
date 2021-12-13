//
//  AuthorView+Constraints.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 05.12.2021.
//

import UIKit

extension AuthorViewController {
    func addViewConstraints() {
        picture.translatesAutoresizingMaskIntoConstraints = false
        fullname.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        moreBtn.translatesAutoresizingMaskIntoConstraints = false
        privateOrderBtn.translatesAutoresizingMaskIntoConstraints = false
        interfaceSegmented.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        picture.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        picture.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        picture.widthAnchor.constraint(equalToConstant: 100).isActive = true
        picture.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        fullname.leadingAnchor.constraint(equalTo: self.picture.trailingAnchor, constant: 10).isActive = true
        fullname.topAnchor.constraint(equalTo: self.picture.topAnchor).isActive = true
        fullname.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
       
        cityLabel.leadingAnchor.constraint(equalTo: self.picture.trailingAnchor, constant: 10).isActive = true
        cityLabel.topAnchor.constraint(equalTo: self.fullname.bottomAnchor, constant: 10).isActive = true
        cityLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        privateOrderBtn.leadingAnchor.constraint(equalTo: self.picture.trailingAnchor, constant: 10).isActive = true
        privateOrderBtn.topAnchor.constraint(equalTo: self.cityLabel.bottomAnchor, constant: 10).isActive = true
        privateOrderBtn.bottomAnchor.constraint(equalTo: self.picture.bottomAnchor).isActive = true
        
        moreBtn.topAnchor.constraint(equalTo: self.cityLabel.bottomAnchor, constant: 10).isActive = true
        moreBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        moreBtn.bottomAnchor.constraint(equalTo: self.picture.bottomAnchor).isActive = true
        
        privateOrderBtn.trailingAnchor.constraint(equalTo: self.moreBtn.leadingAnchor, constant: -10).isActive = true
        moreBtn.widthAnchor.constraint(equalToConstant: 120).isActive = true
        moreBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        privateOrderBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        interfaceSegmented.translatesAutoresizingMaskIntoConstraints = false
        
        interfaceSegmented.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50).isActive = true
        interfaceSegmented.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
        interfaceSegmented.heightAnchor.constraint(equalToConstant: 30).isActive = true
        interfaceSegmented.topAnchor.constraint(equalTo: self.picture.bottomAnchor, constant: 10).isActive = true
        
        self.collectionView.topAnchor.constraint(equalTo: interfaceSegmented.bottomAnchor, constant: 10).isActive = true
        self.collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
