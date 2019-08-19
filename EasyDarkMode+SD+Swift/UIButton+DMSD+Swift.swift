//
//  UIButton+DMSD+Swift.swift
//  EasyDarkMode
//
//  Created by Elenion on 2019/8/20.
//  Copyright © 2019 Elenion. All rights reserved.
//

#if canImport(SDWebImage)

import UIKit

extension SDWebImageAdaptorType where Base == UIButton {
    public func setImage(url light: URL?, dark: URL?, for state: UIControl.State) {
        base.dmsd_setImageUrlLight(light, dark: dark, for: state)
    }
    
    public func setImage(pathString light: String?, dark: String?, for state: UIControl.State) {
        base.dmsd_setImageStringLight(light, dark: dark, for: state)
    }
    
    public func setBackgroundImage(url light: URL?, dark: URL?, for state: UIControl.State) {
        base.dmsd_setBackgroundUrlLight(light, dark: dark, for: state)
    }
    
    public func setBackgroundImage(pathString light: String?, dark: String?, for state: UIControl.State) {
        base.dmsd_setBackgroundStringLight(light, dark: dark, for: state)
    }
}

#endif
