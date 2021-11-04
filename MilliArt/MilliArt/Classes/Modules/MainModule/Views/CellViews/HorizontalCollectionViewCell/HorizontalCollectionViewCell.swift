//
//  HorizontalCollectionViewCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 04.11.2021.
//

import UIKit

final class HorizontalCollectionViewCell: BaseCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .clear
        
//        collectionView.isScrollEnabled = true
        return collectionView
    }()

    static let cellIdentifier = "HCollectionViewModel"
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(collectionView)
        
        backgroundColor = .clear
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    override func loadSubViews() {
        layoutIfNeeded()
        
    }
    override func updateViews() {
        
    }
 func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
   return 100
 }

 func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   let cell : UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

   if indexPath.row % 3 == 0 {
     cell.backgroundColor = .red
   } else if indexPath.row % 3 == 1 {
     cell.backgroundColor = .blue
   } else {
     cell.backgroundColor = .green
   }
   cell.layer.cornerRadius = 10

   return cell;
 }

 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     return CGSize.init(width: 100 * Int.random(in: 1...3), height: 200)
 }
}
