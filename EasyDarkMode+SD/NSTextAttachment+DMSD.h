//
//  NSTextAttachment+DMSD.h
//  EasyInterface
//
//  Created by Elenion on 2019/8/5.
//  Copyright © 2019 Elenion. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTextAttachment (DMSD)

+ (NSTextAttachment *)dm_attachmentWithUrlLight:(nullable NSURL *)light dark:(nullable NSURL *)dark;

+ (NSTextAttachment *)dm_attachmentWithStringLight:(nullable NSString *)light dark:(nullable NSString *)dark;

@end

@interface UILabel (DMSD)

- (void)dm_setAttributedText:(NSAttributedString *)attributedText;

@end

@interface UITextView (DMSD)

- (void)dm_setAttributedText:(NSAttributedString *)attributedText;

@end

NS_ASSUME_NONNULL_END
