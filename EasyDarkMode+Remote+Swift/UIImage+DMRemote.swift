//
//  UIImage+DMRemote.swift
//  EasyDarkMode
//
//  Created by Elenion on 2019/8/22.
//  Copyright © 2019 Elenion. All rights reserved.
//

import UIKit

public extension InterfaceAdaptor where Base == UIImage.Type {
    func imagePathUrl(light: URL, dark: URL, completion: @escaping (Result<UIImage, Error>) -> Void) {
        base.dm_image(withUrlLight: light, dark: dark) { (image, error) in
            if let error = error {
                completion(Result.failure(error))
            } else if let image = image {
                completion(Result.success(image))
            } else {
                let noDataErrror = NSError(domain: "com.EasyDarkMode.Remote", code: 2, userInfo: ["message": "Download failed with unknown reason. Neither image nor error available."])
                completion(Result.failure(noDataErrror))
            }
        }
    }
    
    func imagePathString(light: String, dark: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        base.dm_image(withPathStringLight: light, dark: dark) { (image, error) in
            if let error = error {
                completion(Result.failure(error))
            } else if let image = image {
                completion(Result.success(image))
            } else {
                let noDataErrror = NSError(domain: "com.EasyDarkMode.Remote", code: 2, userInfo: ["message": "Download failed with unknown reason. Neither image nor error available."])
                completion(Result.failure(noDataErrror))
            }
        }
    }
}

public extension InterfaceAdaptor where Base == UIImage.Type {
    @available(*, deprecated, renamed: "imagePathUrl(light:dark:completion:)")
    func image(url light: URL, dark: URL?, completion: @escaping (Result<UIImage, Error>) -> Void) {
        imagePathUrl(light: light, dark: dark ?? light, completion: completion)
    }
    
    @available(*, deprecated, renamed: "imagePathString(light:dark:completion:)")
    func image(pathString light: String, dark: String?, completion: @escaping (Result<UIImage, Error>) -> Void) {
        imagePathString(light: light, dark: dark ?? light, completion: completion)
    }
}
