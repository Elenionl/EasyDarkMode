//
//  KingfisherAdaptor.swift
//  EasyDarkMode
//
//  Created by Elenion on 2019/8/20.
//  Copyright © 2019 Elenion. All rights reserved.
//

import UIKit

public protocol KingfisherAdaptorType: AppearanceAdaptorType {
}

public struct KingfiserNode<Base>: KingfisherAdaptorType {
    public let base: Base
}

extension AppearanceCompatible {
    public var dmkf: KingfiserNode<Self> {
        return KingfiserNode(base: self)
    }
    public static var dmkf: KingfiserNode<Self.Type> {
        return KingfiserNode(base: self)
    }
}
