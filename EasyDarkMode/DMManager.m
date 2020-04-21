//
//  DMManager.m
//  EasyDarkMode
//
//  Created by Elenion on 2020/4/21.
//  Copyright © 2020 Elenion. All rights reserved.
//

#import "DMManager.h"

static DMManager *_manager;

@interface DMManager ()

@end

@implementation DMManager

+ (DMManager *)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = DMManager.new;
        _manager.interfaceStyleForLowerSystem = DMUserInterfaceStyleUnspecified;
    });
    return _manager;
}

@end
