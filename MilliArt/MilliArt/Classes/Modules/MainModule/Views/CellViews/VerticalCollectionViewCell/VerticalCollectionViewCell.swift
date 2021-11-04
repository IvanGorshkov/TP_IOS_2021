//
//  VerticalCollectionViewCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 04.11.2021.
//

import UIKit
import AVFoundation


final class VerticalCollectionViewCell: BaseCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    var array: [VerticalPaintsModel] = []

    lazy var collectionView: UICollectionView = {
        let layout = MosaicViewLayout()
        layout.delegate = self
        layout.numberOfColumns = 2
        layout.cellPadding = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 10, right: 5)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(VerticalCollectionCell.self, forCellWithReuseIdentifier: VerticalCollectionCell.cellIdentifier)
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
    }
    override func updateViews() {
        guard let model = model as? VCollectionViewModel else { return }
        array = model.array
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        collectionView.frame = CGRect(x: 8.0, y: 8.0, width: targetSize.width, height: targetSize.height)
        
        let layout = MosaicViewLayout()
        layout.delegate = self
        layout.numberOfColumns = 2
        layout.cellPadding = 10
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.reloadData()
        return collectionView.collectionViewLayout.collectionViewContentSize
    }

    
 func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     return array.count
 }

 func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VerticalCollectionCell.cellIdentifier, for: indexPath) as? VerticalCollectionCell else { return UICollectionViewCell() }

     cell.configure(model: array[indexPath.row])
   return cell;
 }

}

// MARK: MosaicLayoutDelegate
extension VerticalCollectionViewCell: MosaicLayoutDelegate {

    func collectionView(_ collectionView: UICollectionView, heightForImageAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat {
          let item = array[indexPath.item]
        let image = UIImage(named: item.pic)
          let boundingRect = CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
          let rect = AVMakeRect(aspectRatio: image!.size, insideRect: boundingRect)
        
        return rect.height
    }
    
    func collectionView(_ collectionView: UICollectionView, heightForDescriptionAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat {
        
        let character = array[indexPath.item]
        let descriptionHeight = heightForText(character.name, width: width-24)
        let height = 4 + 17 + 4 + descriptionHeight
        return height
      }
      
      func heightForText(_ text: String, width: CGFloat) -> CGFloat {
        let font = UIFont.systemFont(ofSize: 16)
        let rect = NSString(string: text).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(rect.height)
}

}
