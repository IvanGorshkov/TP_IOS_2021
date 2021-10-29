//
//  ItemSliderCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import UIKit

class ItemSliderCell: BaseCell {
    var slider = UIImageView()

    static let cellIdentifier = "ItemDescSliderCellModel"
    
    
    override func updateViews() {
        guard let model = model as? SliderCellModel else {
            return
        }
        slider.image = UIImage(named: model.pics.first ?? "")
        slider.contentMode = .scaleToFill
    }
    

    override func loadSubViews() {
        backgroundColor = .clear
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
        self.addSubview(slider)
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        slider.topAnchor.constraint(equalTo: super.topAnchor).isActive = true
        slider.centerXAnchor.constraint(equalTo: super.centerXAnchor).isActive = true
        slider.heightAnchor.constraint(equalToConstant: 200).isActive = true
        slider.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
