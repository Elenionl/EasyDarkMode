//
//  UIImage+DM.m
//  EasyInterface
//
//  Created by Elenion on 2019/8/5.
//  Copyright © 2019 Elenion. All rights reserved.
//

#import "UIImage+DM.h"

@implementation UIImage (DM)

+ (UIImage *)dm_imageWithImageLight:(UIImage *)light dark:(UIImage *)dark {
    if (!light) {
        return nil;
    }
#if __IPHONE_13_0
    if (@available(iOS 13.0, *)) {
//        UIImage *image = light ?: UIImage.new;
        UITraitCollection *lightCollection = [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleLight];
        UITraitCollection *darkCollection = [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleDark];
        UITraitCollection *unspecifiedCollection = [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleLight];
        UIImage *image = UIImage.new;
        UIImage *darkPure = [dark.imageAsset imageWithTraitCollection:unspecifiedCollection];
        UIImage *lightPure = [light.imageAsset imageWithTraitCollection:unspecifiedCollection];
        [image.imageAsset registerImage:lightPure withTraitCollection:lightCollection];
        [image.imageAsset registerImage:darkPure withTraitCollection:darkCollection];
        [image.imageAsset registerImage:lightPure withTraitCollection:unspecifiedCollection];
        return image;
    } else {
#endif
        return light;
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
