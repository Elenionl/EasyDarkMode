//
//  SDWebImageAdaptor.swift
//  EasyDarkMode
//
//  Created by Elenion on 2019/8/20.
//  Copyright © 2019 Elenion. All rights reserved.
//



#if canImport(SDWebImage)

import UIKit

public protocol SDWebImageAdaptorType: AppearanceAdaptorType {
}

public struct SDWebImageNode<Base>: SDWebImageAdaptorType {
    public let base: Base
}

extension AppearanceCompatible {
    public var dmsd: SDWebImageNode<Self> {
        return SDWebImageNode(base: self)
    }
    public static var dmsd: SDWebImageNode<Self.Type> {
        return SDWebImageNode(base: self)
    }
}

#endif
