//
//  ItemSliderCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 29.10.2021.
//

import UIKit
import ImageSlideshow
import ImageSlideshowKingfisher

final class ItemSliderCell: BaseCell {
    internal var slider = ImageSlideshow()
    static let cellIdentifier = "ItemDescSliderCellModel"
    
    override func updateViews() {
        guard let model = model as? SliderCellModel else { return }
        slider.setImageInputs(model.pics.map {ImageSource(image: UIImage(named: $0)!)} )
    }

    @objc
    func didTap() {
        guard let model = model as? SliderCellModel else { return }
        model.action?(slider)
    }

    @objc
    func swipeHandler(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
         case .left:
            slider.nextPage(animated: true)
         case .right:
            slider.previousPage(animated: true)
         default:
             break
         }
    }
    
    override func loadSubViews() {
        setUp()
        addConstraintsSlider()
    }
    
    private func setUp() {
        setUpBase()
        setUpSlider()
    }
    
    private func setUpBase() {
        backgroundColor = .clear
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
    }
    
    private func setUpSlider() {
        contentView.addSubview(slider)
        slider.layer.cornerRadius = 10
        slider.slideshowInterval = 0.0
        slider.circular = true
        slider.pageIndicatorPosition = .init(horizontal: .center, vertical: .customBottom(padding: -5))
        slider.contentScaleMode = UIViewContentMode.scaleAspectFill
        
        let recognizerR = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler(_:)))
        recognizerR.direction = UISwipeGestureRecognizer.Direction.right
        slider.addGestureRecognizer(recognizerR)
        
        let recognizerL = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler(_:)))
        recognizerL.direction = UISwipeGestureRecognizer.Direction.left
        slider.addGestureRecognizer(recognizerL)
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
        slider.addGestureRecognizer(gestureRecognizer)
        
    }
}
