//
//  ImageLoader.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 18.11.2021.
//

import UIKit.UIImage
import Firebase

final class ImageLoader {
    public static let shared = ImageLoader()
    
    private let cache: ImageCacheType
    
    private init(cache: ImageCacheType = ImageCache()) {
        self.cache = cache
    }
    
    private let storage = Storage.storage().reference()
    
    func image(with name: String, completion: @escaping (UIImage?) -> Void) {
        if let image = self.cache[name] {
            completion(image)
            return
        }
        
        self.storage.child(name).getData(maxSize: 15 * 1024 * 1024) { data, error in
            if let data = data {
                guard let image = UIImage(data: data) else { return }
                self.cache[name] = image
                completion(image)
                return
            } else {
                print(error?.localizedDescription ?? "")
            }
        }
    }
}
