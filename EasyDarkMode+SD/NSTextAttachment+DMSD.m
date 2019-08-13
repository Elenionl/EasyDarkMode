//
//  NSTextAttachment+DMSD.m
//  EasyInterface
//
//  Created by Elenion on 2019/8/5.
//  Copyright © 2019 Elenion. All rights reserved.
//

#import "NSTextAttachment+DMSD.h"
#import "DMAttachmentManager.h"

@implementation NSTextAttachment (DMSD)

+ (NSTextAttachment *)dm_attachmentWithStringLight:(NSString *)light dark:(NSString *)dark {
    return [DMAttachmentManager.shared attachmentWithPathLight:light dark:dark];
}

+ (NSTextAttachment *)dm_attachmentWithUrlLight:(NSURL *)light dark:(NSURL *)dark {
    return [DMAttachmentManager.shared attachmentWithPathLight:light.path dark:dark.path];
}

@end

@implementation UILabel (DMSD)

- (void)dm_setAttributedText:(NSAttributedString *)attributedText {
    NSAttributedString *string = [DMAttachmentManager.shared registerString:attributedText item:self];
    [self setAttributedText:string];
}

@end

@implementation UITextView (DMSD)

- (void)dm_setAttributedText:(NSAttributedString *)attributedText {
    NSAttributedString *string = [DMAttachmentManager.shared registerString:attributedText item:self];
    [self setAttributedText:string];
}

@end
