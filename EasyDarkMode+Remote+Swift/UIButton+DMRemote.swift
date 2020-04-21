//
//  UIButton+DMRemote.swift
//  EasyDarkMode
//
//  Created by Elenion on 2019/8/22.
//  Copyright © 2019 Elenion. All rights reserved.
//

import UIKit

extension UIButton: InterfaceCompatable {
    
}

public extension InterfaceAdaptor where Base: UIButton {
    func setImagePathUrl(light: URL, dark: URL, for state: UIControl.State) {
        base.dm_setImageUrlLight(light, dark: dark, for: state)
    }
    
    func setImagePathString(light: String, dark: String, for state: UIControl.State) {
        base.dm_setImagePathStringLight(light, dark: dark, for: state)
    }
    
    func setBackgroundImagePathUrl(light: URL, dark: URL, for state: UIControl.State) {
        base.dm_setBackgroundUrlLight(light, dark: dark, for: state)
    }
    
    func setBackgroundImagePathString(light: String, dark: String, for state: UIControl.State) {
        base.dm_setBackgroundPathStringLight(light, dark: dark, for: state)
    }
}

public extension InterfaceAdaptor where Base: UIButton {
    @available(*, deprecated, renamed: "setImagePathUrl(light:dark:for:)")
    func setImage(url light: URL?, dark: URL?, for state: UIControl.State) {
        guard let light = light, let dark = dark else {
            return
        }
        setImagePathUrl(light: light, dark: dark, for: state)
    }
    
    @available(*, deprecated, renamed: "setImagePathString(light:dark:for:)")
    func setImage(pathString light: String?, dark: String?, for state: UIControl.State) {
        guard let light = light, let dark = dark else {
            return
        }
        setImagePathString(light: light, dark: dark, for: state)
    }
    
    @available(*, deprecated, renamed: "setBackgroundImagePathUrl(light:dark:for:)")
    func setBackgroundImage(url light: URL?, dark: URL?, for state: UIControl.State) {
        guard let light = light, let dark = dark else {
            return
        }
        setBackgroundImagePathUrl(light: light, dark: dark, for: state)
    }
    
    @available(*, deprecated, renamed: "setBackgroundImagePathString(light:dark:for:)")
    func setBackgroundImage(pathString light: String?, dark: String?, for state: UIControl.State) {
        guard let light = light, let dark = dark else {
            return
        }
        setBackgroundImagePathString(light: light, dark: dark, for: state)
    }
}
