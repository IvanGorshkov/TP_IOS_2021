//
//  ItemSliderCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import UIKit
import ImageSlideshow
import ImageSlideshowKingfisher

class ItemSliderCell: BaseCell {
    var slider = ImageSlideshow()
    static let cellIdentifier = "ItemDescSliderCellModel"
    
    override func updateViews() {
        sendSubviewToBack(contentView)
        guard let model = model as? SliderCellModel else {
            return
        }
        slider.slideshowInterval = 0.0
        slider.circular = true
        slider.pageIndicatorPosition = .init(horizontal: .center, vertical: .customBottom(padding: -5))
        slider.contentScaleMode = UIViewContentMode.scaleAspectFill
        slider.setImageInputs(model.pics.map({ name in
            return ImageSource(image: UIImage(named: name)!)
        }))
        
        
        let recognizerR = UISwipeGestureRecognizer(target: self, action: #selector(rightSwipe))
        recognizerR.direction = UISwipeGestureRecognizer.Direction.right
        slider.addGestureRecognizer(recognizerR)
        
        let recognizerL = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipe))
        recognizerL.direction = UISwipeGestureRecognizer.Direction.left
        slider.addGestureRecognizer(recognizerL)
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
        slider.addGestureRecognizer(gestureRecognizer)
        }

    @objc func didTap() {
        guard  let model = model as? SliderCellModel else {
            return
        }
                
        model.action?(slider)
    }

    @objc func rightSwipe() {
        slider.previousPage(animated: true)
    }
    
    @objc func leftSwipe() {
        slider.nextPage(animated: true)
    }
    
    override func loadSubViews() {
        backgroundColor = .clear
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
        self.addSubview(slider)
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        slider.topAnchor.constraint(equalTo: super.topAnchor).isActive = true
        slider.centerXAnchor.constraint(equalTo: super.centerXAnchor).isActive = true
        slider.heightAnchor.constraint(equalToConstant: 200).isActive = true
        slider.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 20).isActive = true
        slider.trailingAnchor.constraint(equalTo: super.trailingAnchor, constant: -20).isActive = true
        slider.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        
        slider.layer.cornerRadius = 10
    }
}
