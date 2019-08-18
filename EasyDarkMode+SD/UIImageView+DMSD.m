//
//  UIImageView+DM.m
//  EasyInterface
//
//  Created by Elenion on 2019/8/5.
//  Copyright © 2019 Elenion. All rights reserved.
//

#import "UIImageView+DMSD.h"
#import "UIImage+DM.h"
#import "UIImage+DMSD.h"

@implementation UIImageView (DMSD)

- (void)dmsd_setImageUrlLight:(NSURL *)light dark:(NSURL *)dark {
    __weak __auto_type selfWeak = self;
    [UIImage dmsd_imageWithUrlLight:light dark:dark completion:^(UIImage * _Nullable image, NSError * _Nullable error) {
        selfWeak.image = image;
    }];
}

- (void)dmsd_setImageStringLight:(NSString *)light dark:(NSString *)dark {
    NSURL *lightUrl = light ? [NSURL URLWithString:light] : nil;
    NSURL *darkUrl = dark ? [NSURL URLWithString:dark] : nil;
    [self dmsd_setImageUrlLight:lightUrl dark:darkUrl];
}

@end
