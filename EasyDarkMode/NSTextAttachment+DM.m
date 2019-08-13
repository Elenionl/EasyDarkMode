//
//  NSTextAttachment+DM.m
//  EasyInterface
//
//  Created by Elenion on 2019/8/5.
//  Copyright © 2019 Elenion. All rights reserved.
//

#import "NSTextAttachment+DM.h"
#import "UIImage+DM.h"
#import <objc/runtime.h>
#import "DMAttachmentAssocate.h"

@implementation NSTextAttachment (DM)

+ (NSTextAttachment *)dm_textAttachmentWithImage:(UIImage *)image {
    NSTextAttachment *attachment;
#if __IPHONE_13_0
    if (@available(iOS 13.0, *)) {
        attachment = [NSTextAttachment textAttachmentWithImage:image];
    } else {
#endif
        attachment = NSTextAttachment.new;
        attachment.image = image;
#if __IPHONE_13_0
    }
#endif
    attachment.dm_associate.image = image;
    return attachment;
}

+ (NSTextAttachment *)dm_textAttachmentWithImageName:(NSString *)name {
    UIImage *image = [UIImage imageNamed:name];
    return [self dm_textAttachmentWithImage:image];
}

+ (NSTextAttachment *)dm_textAttachmentWithImageLight:(UIImage *)light dark:(UIImage *)dark {
    UIImage *image = [UIImage dm_imageForAttachmentWithImageLight:light dark:dark];
    return [self dm_textAttachmentWithImage:image];
}

+ (NSTextAttachment *)dm_textAttachmentWithImageNameLight:(NSString *)light dark:(NSString *)dark {
    UIImage *image = [UIImage dm_imageForAttachmentWithNameLight:light dark:dark];
    return [self dm_textAttachmentWithImage:image];
}

- (void)dm_updateWithFont:(UIFont *)font {
    DMAttachmentAssocate *associate = self.dm_associate;
    CGSize size = associate.image.size;
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        size = CGSizeMake(10, 10);
    }
    associate.font = font;
    UIFont *specificFont = font ?: [UIFont systemFontOfSize:14];
    CGFloat heigt = specificFont.lineHeight;
    CGFloat offset = specificFont.descender;
    self.bounds = CGRectMake(0, offset, size.width * heigt / size.height, heigt);
}

@end
