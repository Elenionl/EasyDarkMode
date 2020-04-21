//
//  UIColor+DM.swift
//  EasyDarkMode
//
//  Created by Elenion on 2019/8/22.
//  Copyright © 2019 Elenion. All rights reserved.
//

import UIKit

extension UIColor: InterfaceCompatable {
    
}

public extension InterfaceAdaptor where Base == UIColor.Type {
    func color(light: UIColor, dark: UIColor) -> UIColor {
        return UIColor.dm_color(withColorLight: light, dark: dark)
    }
}

public extension InterfaceAdaptor where Base == UIColor.Type {
    @available(*, deprecated, renamed: "color(light:dark:)")
    func color(color light: UIColor, dark: UIColor?) -> UIColor? {
        return color(light: light, dark: dark ?? light)
    }
}
