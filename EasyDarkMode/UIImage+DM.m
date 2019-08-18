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
#if __IPHONE_13_0
    if (@available(iOS 13.0, *)) {
        UIImage *image = UIImage.new;
        [image.imageAsset registerImage:dark ?: light withTraitCollection:[UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleDark]];
        [image.imageAsset registerImage:light withTraitCollection:[UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleLight]];
        [image.imageAsset registerImage:light withTraitCollection:[UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleUnspecified]];
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
    UIImage *darkImage = [UIImage imageNamed:dark];
    return [self dm_imageWithImageLight:lightImage dark:darkImage];
}

@end
