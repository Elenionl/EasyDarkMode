//
//  DMAttachmentManager.h
//  EasyInterface
//
//  Created by Elenion on 2019/8/5.
//  Copyright © 2019 Elenion. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DMAttachmentManager : NSObject

+ (DMAttachmentManager *)shared;

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)new NS_UNAVAILABLE;

- (NSTextAttachment *)attachmentWithPathLight:(NSString *)light dark:(NSString *)dark;

- (NSAttributedString *)registerString:(NSAttributedString *)string item:(id)item;

@end

NS_ASSUME_NONNULL_END
