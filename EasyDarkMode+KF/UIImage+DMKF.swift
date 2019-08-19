//
//  UIImage+DMKF.swift
//  EasyDarkMode
//
//  Created by Elenion on 2019/8/20.
//  Copyright © 2019 Elenion. All rights reserved.
//

import UIKit
import Kingfisher

extension KingfisherAdaptorType where Base == UIImage.Type {
    public func image(url light: URL, dark: URL?, completion: @escaping (Result<UIImage, Error>) -> Void) {
        let manager = KingfisherManager.shared
        var lightFinish = false
        var darkFinish = false
        var lightImage: UIImage?
        var darkImage: UIImage?
        var error: Error?
        let finishBlock: () -> Void = {
            guard lightFinish && darkFinish else {
                return
            }
            if let error = error {
                completion(Result.failure(error))
                return
            }
            guard let lightImage = lightImage else {
                let theError = NSError(domain: "com.EasyInterface.Kingfisher", code: 1, userInfo: [
                    "message": "Download finish with no light image available."
                ])
                completion(Result.failure(theError))
                return
            }
            guard let image = UIImage.dm.image(image: lightImage, dark: darkImage) else {
                let theError = NSError(domain: "com.EasyInterface.Kingfisher", code: 2, userInfo: [
                    "message": "Fail to create image with result images."
                ])
                completion(Result.failure(theError))
                return
            }
            completion(Result.success(image))
        }
        manager.retrieveImage(with: light, options: nil, progressBlock: nil) { (image, theError, cache, url) in
            lightImage = image
            if theError != nil {
                error = theError
            }
            lightFinish = true
            finishBlock()
        }
        if let dark = dark {
            manager.retrieveImage(with: dark, options: nil, progressBlock: nil) { (image, theError, cache, url) in
                darkImage = image
                if theError != nil {
                    error = theError
                }
                darkFinish = true
                finishBlock()
            }
        } else {
            darkFinish = true
            finishBlock()
        }
    }
    
    public func image(pathString light: String, dark: String?, completion: @escaping (Result<UIImage, Error>) -> Void) {
        guard let lightUrl = URL.init(string: light) else {
            let error = NSError.init(domain: "com.EasyInterface.Kingfisher", code: 0, userInfo: [
                "message": "Counld not create url from the light path string."
            ])
            completion(Result.failure(error))
            return
        }
        var darkUrl: URL?
        if let dark = dark {
            darkUrl = URL.init(string: dark)
        }
        image(url: lightUrl, dark: darkUrl, completion: completion)
    }
}
