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

- (void)dm_setImageUrlLight:(NSURL *)light dark:(NSURL *)dark forState:(UIControlState)state;

- (void)dm_setImagePathStringLight:(NSString *)light dark:(NSString *)dark forState:(UIControlState)state;

- (void)dm_setBackgroundUrlLight:(NSURL *)light dark:(NSURL *)dark forState:(UIControlState)state;

- (void)dm_setBackgroundPathStringLight:(NSString *)light dark:(NSString *)dark forState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
