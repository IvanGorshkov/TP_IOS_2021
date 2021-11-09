//
//  AREdit+Constraints.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 01.11.2021.
//

import UIKit

extension AREditViewController {
    internal func addConstraintsAREdit() {
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -30).isActive = true
        self.contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true

        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        self.imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
         self.imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 300).isActive = true
        self.imageView.widthAnchor.constraint(lessThanOrEqualToConstant: 300).isActive = true

        self.done!.translatesAutoresizingMaskIntoConstraints = false
        self.done.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        self.done.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.done.heightAnchor.constraint(equalToConstant: 35).isActive = true
        self.done.widthAnchor.constraint(equalToConstant: 200).isActive = true

        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10).isActive = true
        self.titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        self.titleLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true

        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        self.collectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        frameWLabel.translatesAutoresizingMaskIntoConstraints = false
        frameWLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        frameWLabel.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor, constant: 10).isActive = true

        frameRLabel.translatesAutoresizingMaskIntoConstraints = false
        frameRLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        frameRLabel.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor, constant: 10).isActive = true

        frameWControl.translatesAutoresizingMaskIntoConstraints = false
        frameWControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        frameWControl.topAnchor.constraint(equalTo: self.frameWLabel.bottomAnchor, constant: 10).isActive = true

        frameRControl.translatesAutoresizingMaskIntoConstraints = false
        frameRControl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        frameRControl.topAnchor.constraint(equalTo: self.frameRLabel.bottomAnchor, constant: 10).isActive = true
    }
}
