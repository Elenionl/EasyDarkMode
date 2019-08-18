//
//  UIButton+DM.h
//  EasyInterface
//
//  Created by Elenion on 2019/8/5.
//  Copyright © 2019 Elenion. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (DMSD)

- (void)dmsd_setImageUrlLight:(nullable NSURL *)light dark:(nullable NSURL *)dark forState:(UIControlState)state;

- (void)dmsd_setImageStringLight:(nullable NSString *)light dark:(nullable NSString *)dark forState:(UIControlState)state;

- (void)dmsd_setBackgroundUrlLight:(nullable NSURL *)light dark:(nullable NSURL *)dark forState:(UIControlState)state;

- (void)dmsd_setBackgroundStringLight:(nullable NSString *)light dark:(nullable NSString *)dark forState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
