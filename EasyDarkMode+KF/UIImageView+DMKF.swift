//
//  UIImageView+DMKF.swift
//  EasyDarkMode
//
//  Created by Elenion on 2019/8/20.
//  Copyright © 2019 Elenion. All rights reserved.
//

import UIKit

extension KingfisherAdaptorType where Base: UIImageView {
    public func setImage(url light: URL?, dark: URL?) {
        guard let light = light else {
            base.image = nil
            return
        }
        UIImage.dmkf.image(url: light, dark: dark) { [weak base] (result) in
            switch result {
            case .success(let image):
                base?.image = image
            case .failure:
                break
            }
        }
    }
    
    public func setImage(pathString light: String?, dark: String?) {
        var lightUrl: URL?
        if let light = light {
            lightUrl = URL(string: light)
        }
        var darkUrl: URL?
        if let dark = dark {
            darkUrl = URL(string: dark)
        }
        setImage(url: lightUrl, dark: darkUrl)
    }
}
