//
//  AppearanceCompatible.swift
//  EasyDarkMode
//
//  Created by Elenion on 2019/8/20.
//  Copyright © 2019 Elenion. All rights reserved.
//

import UIKit

public protocol AppearanceCompatible {
}

public protocol AppearanceAdaptorType {
    associatedtype Base
    var base: Base { get }
}

public struct AppearanceNode<Base>: AppearanceAdaptorType {
    public let base: Base
}

public extension AppearanceCompatible {
    var dm: AppearanceNode<Self> {
        return AppearanceNode(base: self)
    }
    static var dm: AppearanceNode<Self.Type> {
        return AppearanceNode(base: self)
    }
}
