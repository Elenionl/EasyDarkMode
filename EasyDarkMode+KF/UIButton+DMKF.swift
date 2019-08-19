//
//  UIButton+DMKF.swift
//  EasyDarkMode
//
//  Created by Elenion on 2019/8/20.
//  Copyright © 2019 Elenion. All rights reserved.
//

import UIKit

extension KingfisherAdaptorType where Base: UIButton {
    public func setImage(url light: URL?, dark: URL?, for state: UIControl.State) {
        guard let light = light else {
            base.setImage(nil, for: state)
            return
        }
        UIImage.dmkf.image(url: light, dark: dark) { [weak base] (result) in
            switch result {
            case .success(let image):
                base?.setImage(image, for: state)
            case .failure:
                break;
            }
        }
    }
    
    public func setImage(pathString light: String?, dark: String?, for state: UIControl.State) {
        var lightUrl: URL?
        if let light = light {
            lightUrl = URL(string: light)
        }
        var darkUrl: URL?
        if let dark = dark {
            darkUrl = URL(string: dark)
        }
        setImage(url: lightUrl, dark: darkUrl, for: state)
    }
    
    public func setBackgroundImage(url light: URL?, dark: URL?, for state: UIControl.State) {
        guard let light = light else {
            base.setBackgroundImage(nil, for: state)
            return
        }
        UIImage.dmkf.image(url: light, dark: dark) { [weak base] (result) in
            switch result {
            case .success(let image):
                base?.setBackgroundImage(image, for: state)
            case .failure:
                break;
            }
        }
    }
    
    public func setBackgroundImage(pathString light: String?, dark: String?, for state: UIControl.State) {
        var lightUrl: URL?
        if let light = light {
            lightUrl = URL(string: light)
        }
        var darkUrl: URL?
        if let dark = dark {
            darkUrl = URL(string: dark)
        }
        setBackgroundImage(url: lightUrl, dark: darkUrl, for: state)
    }
}
