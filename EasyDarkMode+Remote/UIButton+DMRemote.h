//
//  UIButton+DMRemote.h
//  EasyDarkMode
//
//  Created by Elenion on 2019/8/21.
//  Copyright © 2019 Elenion. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (DMRemote)

- (void)dm_setImageUrlLight:(nullable NSURL *)light dark:(nullable NSURL *)dark forState:(UIControlState)state;

- (void)dm_setImagePathStringLight:(nullable NSString *)light dark:(nullable NSString *)dark forState:(UIControlState)state;

- (void)dm_setBackgroundUrlLight:(nullable NSURL *)light dark:(nullable NSURL *)dark forState:(UIControlState)state;

- (void)dm_setBackgroundPathStringLight:(nullable NSString *)light dark:(nullable NSString *)dark forState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
