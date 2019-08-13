//
//  NSTextAttachment+DM.h
//  EasyInterface
//
//  Created by Elenion on 2019/8/5.
//  Copyright © 2019 Elenion. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTextAttachment (DM)

+ (NSTextAttachment *)dm_textAttachmentWithImage:(UIImage *)image;

+ (NSTextAttachment *)dm_textAttachmentWithImageName:(NSString *)name;

+ (NSTextAttachment *)dm_textAttachmentWithImageLight:(UIImage *)light dark:(UIImage *)dark;

+ (NSTextAttachment *)dm_textAttachmentWithImageNameLight:(NSString *)light dark:(NSString *)dark;

- (void)dm_updateWithFont:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END
