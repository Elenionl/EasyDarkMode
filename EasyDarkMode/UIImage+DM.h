//
//  UIImage+DM.h
//  EasyInterface
//
//  Created by Elenion on 2019/8/5.
//  Copyright © 2019 Elenion. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (DM)

+ (UIImage *)dm_imageWithImageLight:(UIImage *)light dark:(nullable UIImage *)dark;

+ (UIImage *)dm_imageWithNameLight:(NSString *)light dark:(nullable NSString *)dark;

+ (UIImage *)dm_imageForAttachmentWithImageLight:(UIImage *)light dark:(UIImage *)dark;

+ (UIImage *)dm_imageForAttachmentWithNameLight:(NSString *)light dark:(NSString *)dark;

@end

NS_ASSUME_NONNULL_END
