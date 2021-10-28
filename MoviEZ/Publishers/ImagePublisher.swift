//
//  ImagePublisher.swift
//  MoviEZ
//
//  Created by Felipe Rivera on 26/10/21.
//

import SwiftUI
import UIKit

//NScache init
private let cache = NSCache<AnyObject, AnyObject>()
//Class to handle image load and cache
class ImageLoader: ObservableObject {
    //publihsed Objects
    @Published var image: UIImage?
    @Published var isLoading = false
    //image cache
    var imageCache = cache
    
    //MARK: LoadImage
    /// load image from url if it is not on cache
    /// - parameter url: url for getting the image
    func loadImage(with url: URL) {
        let urlString = url.absoluteString
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        // background thread for getting the image
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else {return}
            do {
                let data = try Data(contentsOf: url)
                guard let image = UIImage(data: data) else {
                    return
                }
                self.imageCache.setObject(image, forKey: urlString as AnyObject)
                DispatchQueue.main.async { [weak self] in
                    self?.image = image
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
