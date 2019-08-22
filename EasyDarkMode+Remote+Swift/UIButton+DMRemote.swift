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
    func setImage(url light: URL?, dark: URL?, for state: UIControl.State) {
        base.dm_setImageUrlLight(light, dark: dark, for: state)
    }
    
    func setImage(pathString light: String?, dark: String?, for state: UIControl.State) {
        base.dm_setImagePathStringLight(light, dark: dark, for: state)
    }
    
    func setBackgroundImage(url light: URL?, dark: URL?, for state: UIControl.State) {
        base.dm_setBackgroundUrlLight(light, dark: dark, for: state)
    }
    
    func setBackgroundImage(pathString light: String?, dark: String?, for state: UIControl.State) {
        base.dm_setBackgroundPathStringLight(light, dark: dark, for: state)
    }
}
