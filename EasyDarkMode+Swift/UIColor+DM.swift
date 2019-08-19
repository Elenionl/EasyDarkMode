//
//  UIColor+DM.swift
//  EasyDarkMode
//
//  Created by Elenion on 2019/8/20.
//  Copyright © 2019 Elenion. All rights reserved.
//

import UIKit

extension UIColor: AppearanceCompatible {
    
}

extension AppearanceNode where Base == UIColor.Type {
    public func color(image light: UIColor, dark: UIColor?) -> UIColor {
        return base.dm_color(withColorLight: light, dark: dark)
    }
}
