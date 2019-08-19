//
//  UIImageView+DMSD+Swift.swift
//  EasyDarkMode
//
//  Created by Elenion on 2019/8/20.
//  Copyright © 2019 Elenion. All rights reserved.
//

#if canImport(SDWebImage)

import UIKit

extension SDWebImageAdaptorType where Base == UIImageView {
    func setImage(url light: URL?, dark: URL?) {
        base.dmsd_setImageUrlLight(light, dark: dark    )
    }
    
    func setImage(pathString light: String?, dark: String?) {
        base.dmsd_setImageStringLight(light, dark: dark )
    }
}

#endif
