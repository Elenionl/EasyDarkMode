//
//  UIColor+DM.m
//  EasyInterface
//
//  Created by Elenion on 2019/8/5.
//  Copyright © 2019 Elenion. All rights reserved.
//

#import "UIColor+DM.h"
#import "DMManager.h"

@implementation UIColor (DM)

+ (UIColor *)dm_colorWithColorLight:(UIColor *)light dark:(UIColor *)dark {
#if __IPHONE_13_0
    if (@available(iOS 13.0, *)) {
        return [self colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            switch (traitCollection.userInterfaceStyle) {
                case UIUserInterfaceStyleDark:
                    return dark;
                case UIUserInterfaceStyleLight:
                case UIUserInterfaceStyleUnspecified:
                default:
                    return light;
            }
        }];
    } else {
#endif
        switch (DMManager.shared.interfaceStyleForLowerSystem) {
            case DMUserInterfaceStyleDark:
                return dark;
            case DMUserInterfaceStyleLight:
            case DMUserInterfaceStyleUnspecified:
            default:
                return light;
        }
#if __IPHONE_13_0
    }
#endif
}

@end
