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
    func setImage(url light: URL?, dark: URL?) {
        base.dm_setImageUrlLight(light, dark: dark)
    }
    
    func setImage(stringPath light: String?, dark: String?) {
        base.dm_setImagePathStringLight(light, dark: dark)
    }
}
