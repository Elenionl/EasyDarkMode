//
//  UIColor+DM.h
//  EasyInterface
//
//  Created by Elenion on 2019/8/5.
//  Copyright © 2019 Elenion. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (DM)

// Create color with light and dark colors.
+ (UIColor *)dm_colorWithColorLight:(UIColor *)light dark:(UIColor *)dark;

@end

NS_ASSUME_NONNULL_END
