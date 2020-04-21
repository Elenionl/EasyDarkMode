//
//  UIImageVIew+DMRemote.swift
//  EasyDarkMode
//
//  Created by Elenion on 2019/8/22.
//  Copyright © 2019 Elenion. All rights reserved.
//

import UIKit

extension UIImageView: InterfaceCompatable {
    
}

public extension InterfaceAdaptor where Base: UIImageView {
    func setImagePathUrl(light: URL, dark: URL) {
        base.dm_setImageUrlLight(light, dark: dark)
    }
    
    func setImagePathString(light: String, dark: String) {
        base.dm_setImagePathStringLight(light, dark: dark)
    }
}

public extension InterfaceAdaptor where Base: UIImageView {
    @available(*, deprecated, renamed: "setImagePathUrl(light:dark:)")
    func setImage(url light: URL?, dark: URL?) {
        guard let light = light, let dark = dark else {
            return
        }
        setImagePathUrl(light: light, dark: dark)
    }
    
    @available(*, deprecated, renamed: "setImagePathString(light:dark:)")
    func setImage(stringPath light: String?, dark: String?) {
        guard let light = light, let dark = dark else {
            return
        }
        setImagePathString(light: light, dark: dark)
    }
}
