//
//  UIImageView+DM.h
//  EasyInterface
//
//  Created by Elenion on 2019/8/5.
//  Copyright © 2019 Elenion. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (DMSD)

- (void)dmsd_setImageUrlLight:(nullable NSURL *)light dark:(nullable NSURL *)dark;

- (void)dmsd_setImageStringLight:(nullable NSString *)light dark:(nullable NSString *)dark;

@end

NS_ASSUME_NONNULL_END
