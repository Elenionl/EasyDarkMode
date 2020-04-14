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
        UIImage *image = UIImage.new;
        [image.imageAsset registerImage:light withTraitCollection:lightCollection];
        [image.imageAsset registerImage:dark withTraitCollection:darkCollection];
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

- (UIImage *)dm_buttonImage {
    if (@available(iOS 12.0, *)) {
        UITraitCollection *lightCollection = [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleLight];
        UITraitCollection *darkColleciton = [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleDark];
        UITraitCollection *unspecified = [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleUnspecified];
        UIImage *newImage = [[self.imageAsset imageWithTraitCollection:unspecified] copy];
        [newImage.imageAsset registerImage:[self.imageAsset imageWithTraitCollection:lightCollection] withTraitCollection:lightCollection];
        [newImage.imageAsset registerImage:[self.imageAsset imageWithTraitCollection:darkColleciton] withTraitCollection:darkColleciton];
        return newImage;
    } else {
        return self;
    }
    
}

@end
