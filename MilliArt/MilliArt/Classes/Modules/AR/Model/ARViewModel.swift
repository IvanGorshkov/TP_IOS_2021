//
//  ARViewModel.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 01.11.2021.
//

import UIKit

final class ARViewModel: ARViewModelDescription {
    private var model: PaintingARModel
    
    var ARpic: String {
        get {
            return model.pic ?? ""
        }
    }
    
    var ARwidth: CGFloat {
        get {
            return CGFloat(model.width / 100)
        }
    }
    
    var ARheight: CGFloat {
        get {
            return CGFloat(model.height / 100)
        }
    }
    
    var ARborderThickness: (h: CGFloat, w: CGFloat) {
        set {
            model.borderThickness = Float(newValue.h)
        }
        get {
            return (h: ARheight + CGFloat(model.borderThickness / 100), w: ARwidth + CGFloat(model.borderThickness / 100))
        }
    }
    
    var ARborderRounded: CGFloat {
        get {
            return CGFloat(model.borderRounded / 100)
        }
        set {
            model.borderRounded = Float(newValue)
        }
    }
    
    var ARmaterial: String {
        get {
            return model.material
        }
        set {
            model.material = newValue
        }
    }
    
    var ARmaterialColor: String {
        get {
            return "art.scnassets/\(model.material)Color.jpg"
        }
    }
    
    func copy() -> ARViewModelDescription {
        return ARViewModel.init(model: self.model)
    }
    
    init(model: PaintingARModel) {
        self.model = model
    }
}