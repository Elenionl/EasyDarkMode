//
//  UIImage+DM.swift
//  EasyDarkMode
//
//  Created by Elenion on 2019/8/20.
//  Copyright © 2019 Elenion. All rights reserved.
//

import UIKit

extension UIImage: AppearanceCompatible {
    
}

extension AppearanceNode where Base == UIImage.Type {
    public func image(image light: UIImage, dark: UIImage?) -> UIImage? {
        return base.dm_image(withImageLight: light, dark: dark)
    }
    
    public func image(name light: String, dark: String?) -> UIImage? {
        return base.dm_image(withNameLight: light, dark: dark)
    }
}
