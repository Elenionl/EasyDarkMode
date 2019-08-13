//
//  UIButton+DM.m
//  EasyInterface
//
//  Created by Elenion on 2019/8/5.
//  Copyright © 2019 Elenion. All rights reserved.
//

#import "UIButton+DMSD.h"
#import "UIImage+DM.h"
#import "UIImage+DMSD.h"

@implementation UIButton (DMSD)

- (void)dm_setImageUrlLight:(NSURL *)light dark:(NSURL *)dark forState:(UIControlState)state {
    __weak __auto_type selfWeak = self;
    [UIImage dm_imageWithUrlLight:light dark:dark completion:^(UIImage * _Nullable image, NSError * _Nullable error) {
        [selfWeak setImage:image forState:state];
    }];
}

- (void)dm_setImageStringLight:(NSString *)light dark:(NSString *)dark forState:(UIControlState)state {
    NSURL *lightUrl = light ? [NSURL URLWithString:light] : nil;
    NSURL *darkUrl = dark ? [NSURL URLWithString:dark] : nil;
    [self dm_setImageUrlLight:lightUrl dark:darkUrl forState:state];
}

- (void)dm_setBackgroundUrlLight:(NSURL *)light dark:(NSURL *)dark forState:(UIControlState)state {
    __weak __auto_type selfWeak = self;
    [UIImage dm_imageWithUrlLight:light dark:dark completion:^(UIImage * _Nullable image, NSError * _Nullable error) {
        [selfWeak setBackgroundImage:image forState:state];
    }];
}

- (void)dm_setBackgroundStringLight:(NSString *)light dark:(NSString *)dark forState:(UIControlState)state {
    NSURL *lightUrl = light ? [NSURL URLWithString:light] : nil;
    NSURL *darkUrl = dark ? [NSURL URLWithString:dark] : nil;
    [self dm_setBackgroundUrlLight:lightUrl dark:darkUrl forState:state];
}

@end
