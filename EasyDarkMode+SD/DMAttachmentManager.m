//
//  DMAttachmentManager.m
//  EasyInterface
//
//  Created by Elenion on 2019/8/5.
//  Copyright © 2019 Elenion. All rights reserved.
//

#import "DMAttachmentManager.h"
#import <SDWebImage/SDWebImage.h>
#import "NSTextAttachment+DM.h"
#import "UIImage+DMSD.h"
#import "DMAttachmentAssocate.h"
@interface DMAttachmentManager ()

/// This is the cache of the downloaded images.
@property (nonatomic, strong) NSCache<NSString *, UIImage *> *imageCache;
/// This is the labels to be updated after image download finished
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSPointerArray *> *labelsNeedUpdate;

@end

@implementation DMAttachmentManager

+ (DMAttachmentManager *)shared {
    static DMAttachmentManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] initPrivate];
    });
    return manager;
}

- (instancetype)initPrivate {
    self = [super init];
    _imageCache = NSCache.new;
    _imageCache.countLimit = 30;
    _labelsNeedUpdate = NSMutableDictionary.new;
    return self;
}

- (NSTextAttachment *)attachmentWithPathLight:(NSString *)light dark:(NSString *)dark {
    UIImage *lightImage = [self imageCacheWithPath:light];
    UIImage *darkImage = [self imageCacheWithPath:dark];
    if (lightImage && darkImage) {
        NSTextAttachment *attachment = [NSTextAttachment dm_textAttachmentWithImageLight:lightImage dark:darkImage];
        return attachment;
    }
    NSTextAttachment *placeholder = NSTextAttachment.new;
    DMAttachmentAssocate *associate = placeholder.dm_associate;
    associate.lightPath = light;
    associate.darkPath = dark;
    return placeholder;
}

- (void)downloadImageWithPathLight:(NSString *)light dark:(NSString *)dark {
    __weak __auto_type selfWeak = self;
    [UIImage dm_imageWithPathStringLight:light dark:dark completion:^(UIImage * _Nullable image, NSError * _Nullable error) {
        if (image) {
            NSString *path = [NSString stringWithFormat:@"%@&**&%@", light ?: @"", dark ?: @""];
            [selfWeak.imageCache setObject:image forKey:path];
            [selfWeak didDownloadImageWithPath:path];
        }
    }];
}

- (NSAttributedString *)registerString:(NSAttributedString *)string item:(id)item {
    NSArray<NSString *> *unfulfilledKeys;
    NSMutableAttributedString *newString = [self updateOriginString:string unfulfilledKeys:&unfulfilledKeys];
    for (NSString *key in unfulfilledKeys) {
        NSPointerArray *array = self.labelsNeedUpdate[key];
        if (!array) {
            array = NSPointerArray.new;
            self.labelsNeedUpdate[key] = array;
        }
        [array addPointer:(__bridge void * _Nullable)(item)];
    }
    return newString;
}

- (void)didDownloadImageWithPath:(NSString *)path {
    NSPointerArray *labelsToUpdate = self.labelsNeedUpdate[path];
    [labelsToUpdate compact];
    if (!labelsToUpdate.count) {
        [self.labelsNeedUpdate removeObjectForKey:path];
        return;
    }
    for (unsigned long i = labelsToUpdate.count - 1; i >= 0; i--) {
        id item = [labelsToUpdate pointerAtIndex:i];
        if (!item) {
            continue;
        }
        if (![item respondsToSelector:@selector(attributedText)] || ![item respondsToSelector:@selector(setAttributedText:)]) {
            [labelsToUpdate removePointerAtIndex:i];
            continue;
        }
        NSAttributedString *text = [item attributedText];
        NSArray<NSString *> *unfulfilled;
        NSMutableAttributedString *newText = [self updateOriginString:text unfulfilledKeys:&unfulfilled];
        [item setAttributedText:newText];
        if (!unfulfilled.count) {
            [labelsToUpdate removePointerAtIndex:i];
        }
    }
}

- (NSMutableAttributedString *)updateOriginString:(NSAttributedString *)originString unfulfilledKeys:(NSArray **)keys {
    NSMutableAttributedString *resultString = originString.mutableCopy;
    NSRange range = NSMakeRange(0, resultString.length);
    NSMutableArray *array = NSMutableArray.new;
    [resultString enumerateAttribute:NSAttachmentAttributeName inRange:range options:NSAttributedStringEnumerationReverse usingBlock:^(id  _Nullable value, NSRange range, BOOL * _Nonnull stop) {
        NSTextAttachment *attachment = value;
        DMAttachmentAssocate *associate = attachment.dm_associate;
        NSString *path = [NSString stringWithFormat:@"%@&**&%@", associate.lightPath ?: @"", associate.darkPath ?: @""];
        if (!path) {
            return;
        }
        NSTextAttachment *newAttachment = [self attachmentWithOriginAttachment:attachment];
        if (!newAttachment) {
            [array addObject:path];
            return;
        }
        [resultString addAttribute:NSAttachmentAttributeName value:attachment range:range];
    }];
    *keys = array;
    return resultString;
}

- (NSTextAttachment *)attachmentWithOriginAttachment:(NSTextAttachment *)originAttachment {
    DMAttachmentAssocate *associate = originAttachment.dm_associate;
    NSString *path = [NSString stringWithFormat:@"%@&**&%@", associate.lightPath ?: @"", associate.darkPath ?: @""];
    UIImage *image = [self imageCacheWithPath:path];
    if (!image) {
        return nil;
    }
    NSTextAttachment *newAttachment = [NSTextAttachment dm_textAttachmentWithImage:image];
    [newAttachment dm_updateWithFont:associate.font ?: [UIFont systemFontOfSize:14]];
    return newAttachment;
}

- (nullable UIImage *)imageCacheWithPath:(NSString *)path {
    UIImage *memoryCacheImage = [self.imageCache objectForKey:path];
    if (memoryCacheImage) {
        return memoryCacheImage;
    }
    NSString *sdCachePath =  [[SDImageCache sharedImageCache] cachePathForKey:path];
    if (path) {
        NSData *sdCacheData = [NSData dataWithContentsOfFile:sdCachePath];
        if (sdCacheData) {
            UIImage *sdCacheImage = [UIImage imageWithData:sdCacheData];
            if (sdCacheImage) {
                [self.imageCache setObject:sdCacheImage forKey:path];
                return sdCacheImage;
            }
        }
    }
    return nil;
}

@end
