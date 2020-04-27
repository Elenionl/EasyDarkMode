//
//  UIImage+DM.m
//  EasyInterface
//
//  Created by Elenion on 2019/8/5.
//  Copyright © 2019 Elenion. All rights reserved.
//

#import "UIImage+DM.h"
#import "DMManager.h"

@implementation UIImage (DM)

+ (UIImage *)dm_imageWithImageLight:(UIImage *)light dark:(UIImage *)dark {
    if (!light) {
        return nil;
    }
#if __IPHONE_13_0
    if (@available(iOS 13.0, *)) {
        UITraitCollection *const scaleTraitCollection = [UITraitCollection currentTraitCollection];
        UITraitCollection *const darkUnscaledTraitCollection = [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleDark];
        UITraitCollection *const darkScaledTraitCollection = [UITraitCollection traitCollectionWithTraitsFromCollections:@[scaleTraitCollection, darkUnscaledTraitCollection]];
        UIImage *image = [light imageWithConfiguration:[light.configuration configurationWithTraitCollection:[UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleLight]]];
        UIImage *darkImage = [dark imageWithConfiguration:[dark.configuration configurationWithTraitCollection:[UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleDark]]];
        [image.imageAsset registerImage:darkImage withTraitCollection:darkScaledTraitCollection];
        return image;
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

+ (UIImage *)dm_imageWithNameLight:(NSString *)light dark:(NSString *)dark {
    UIImage *lightImage = [UIImage imageNamed:light];
    if (!lightImage) {
        return nil;
    }
    UIImage *darkImage = [UIImage imageNamed:dark];
    return [self dm_imageWithImageLight:lightImage dark:darkImage];
}

@end
