//
//  HorizontalCollectionViewCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 04.11.2021.
//

import UIKit

final class HorizontalCollectionViewCell: BaseCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    var array: [HorizontalModel] = []

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HorizontalCollectionView.self, forCellWithReuseIdentifier: HorizontalCollectionView.cellIdentifier)
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()

    static let cellIdentifier = "HCollectionViewModel"
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(collectionView)
        collectionView.showsHorizontalScrollIndicator = false
        backgroundColor = .clear
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true

        collectionView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
    }
    
    override func loadSubViews() {
        
    }
    override func updateViews() {
        guard let model = model as? HCollectionViewModel else { return }
        array = model.array
        collectionView.reloadData()
    }

 func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     return array.count
 }

 func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCollectionView.cellIdentifier, for: indexPath) as? HorizontalCollectionView else { return UICollectionViewCell() }
     
     cell.configure(model: array[indexPath.row])
   return cell;
 }

}
