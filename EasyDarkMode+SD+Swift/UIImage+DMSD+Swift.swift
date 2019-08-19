//
//  UIImage+DMSD+Swift.swift
//  EasyDarkMode
//
//  Created by Elenion on 2019/8/20.
//  Copyright © 2019 Elenion. All rights reserved.
//

#if canImport(SDWebImage)

import UIKit

extension SDWebImageAdaptorType where Base == UIImage.Type {
    public func image(url light: URL, dark: URL?, completion: @escaping (Result<UIImage, Error>) -> Void) {
        base.dmsd_image(withUrlLight: light, dark: dark) { (image, error) in
            if let image = image {
                completion(Result.success(image))
            } else if let error = error {
                completion(Result.failure(error))
            } else {
                let error = NSError(domain: "com.EasyInterface.SDWebImage", code: 1, userInfo: [
                    "message": "No error and no image available, due to unknown reason."
                ])
                completion(Result.failure(error))
            }
        }
    }
    
    public func image(pathString light: String, dark: String?, completion: @escaping (Result<UIImage, Error>) -> Void) {
        base.dmsd_image(withPathStringLight: light, dark: dark) { (image, error) in
            if let image = image {
                completion(Result.success(image))
            } else if let error = error {
                completion(Result.failure(error))
            } else {
                let error = NSError(domain: "com.EasyInterface.SDWebImage", code: 1, userInfo: [
                    "message": "No error and no image available, due to unknown reason."
                ])
                completion(Result.failure(error))
            }
        }
    }
}

#endif
