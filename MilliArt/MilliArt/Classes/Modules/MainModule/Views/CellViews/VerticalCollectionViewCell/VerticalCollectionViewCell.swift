//
//  VerticalCollectionViewCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 04.11.2021.
//

import UIKit


final class VerticalCollectionViewCell: BaseCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        return collectionView
    }()

    static let cellIdentifier = "VCollectionViewModel"
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(collectionView)
        
        backgroundColor = .clear
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true

        
    }
    override func loadSubViews() {
        contentView.layoutIfNeeded()
    }
    override func updateViews() {
        
    }
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        collectionView.frame = CGRect(x: 8.0, y: 8.0, width: targetSize.width, height: targetSize.height)
        return collectionView.collectionViewLayout.collectionViewContentSize
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
   cell.contentView.setNeedsLayout()
   return cell;
 }

 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     return CGSize.init(width: 100 * Int.random(in: 1...3), height: 200)
 }
}

class DynamicCollectionView: UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()
        if bounds.size != intrinsicContentSize {
            invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
            return self.contentSize
    }
}

