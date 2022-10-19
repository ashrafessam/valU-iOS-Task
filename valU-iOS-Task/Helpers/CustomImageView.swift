//
//  CustomImageView.swift
//  valU-iOS-Task
//
//  Created by Ashraf Essam on 19/10/2022.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {

        var imageUrlString: String?
        //Loading Images From Web Service.
        func loadImageUsingUrlString(urlString: String){
            imageUrlString = urlString
            
            let url = NSURL(string: urlString)
            
            image = nil
            
            if let imageFromCache = imageCache.object(forKey: urlString as NSString) as? UIImage {
                self.image = imageFromCache
                return
            }
            
            URLSession.shared.dataTask(with: url! as URL) { (data, response, error) in
                
                if error != nil {
                    print(error ?? "")
                    return
                }
                DispatchQueue.main.async {
                    let imageToCache = UIImage(data: data!)
                    
                    if self.imageUrlString == urlString {
                        self.image = imageToCache
                    }
                    imageCache.setObject(imageToCache!, forKey: urlString as NSString)
                }
            }.resume()
        }
}
