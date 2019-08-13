//
//  DMAttachmentAssocate.h
//  EasyDarkMode
//
//  Created by Elenion on 2019/8/14.
//  Copyright © 2019 Elenion. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DMAttachmentAssocate : NSObject

@property (nonatomic, strong, nullable) UIImage *image;

@property (nonatomic, strong, nullable) UIFont *font;

@property (nonatomic, copy, nullable) NSString *lightPath;

@property (nonatomic, copy, nullable) NSString *darkPath;

@end

@interface NSTextAttachment (DMAssociate)

@property (nonatomic, strong) DMAttachmentAssocate *dm_associate;

@end

NS_ASSUME_NONNULL_END
