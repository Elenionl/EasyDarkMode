//
//  InterfaceAdaptor.swift
//  EasyDarkMode
//
//  Created by Elenion on 2019/8/22.
//  Copyright © 2019 Elenion. All rights reserved.
//

import UIKit

public protocol InterfaceCompatable {
    associatedtype Compatable
    var dm: Compatable { get }
}

public struct InterfaceAdaptor<Base> {
    public var base: Base
}

public extension InterfaceCompatable {
    var dm: InterfaceAdaptor<Self> {
        return InterfaceAdaptor(base: self)
    }
    
    static var dm: InterfaceAdaptor<Self.Type> {
        return InterfaceAdaptor(base: self.self)
    }
}
