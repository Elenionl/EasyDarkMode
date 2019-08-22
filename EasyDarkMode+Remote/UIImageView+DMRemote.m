//
//  UIImageVIew+DMRemote.m
//  EasyDarkMode
//
//  Created by Elenion on 2019/8/21.
//  Copyright © 2019 Elenion. All rights reserved.
//

#import "UIImageView+DMRemote.h"
#import "UIImage+DMRemote.h"
@implementation UIImageView (DMRemote)

- (void)dm_setImageUrlLight:(NSURL *)light dark:(NSURL *)dark {
    __weak __auto_type selfWeak = self;
    [UIImage dm_imageWithUrlLight:light dark:dark completion:^(UIImage * _Nullable image, NSError * _Nullable error) {
        selfWeak.image = image;
    }];
}

- (void)dm_setImagePathStringLight:(NSString *)light dark:(NSString *)dark {
    NSURL *lightUrl = light ? [NSURL URLWithString:light] : nil;
    NSURL *darkUrl = dark ? [NSURL URLWithString:dark] : nil;
    [self dm_setImageUrlLight:lightUrl dark:darkUrl];
}

@end
