//
//  UIImage+DMSD.m
//  EasyInterface
//
//  Created by 徐汉平 on 2019/8/10.
//  Copyright © 2019 Elenion. All rights reserved.
//

#import "UIImage+DMSD.h"
#import <SDWebImage/SDWebImage.h>
#import "UIImage+DM.h"
@implementation UIImage (DMSD)

+ (void)dm_imageWithPathStringLight:(NSString *)light dark:(NSString *)dark completion:(void (^)(UIImage * _Nullable, NSError * _Nullable))completion {
    NSParameterAssert(light);
    NSURL *lightUrl = [NSURL URLWithString:light];
    NSURL *darkUrl = dark ? [NSURL URLWithString:dark] : nil;
    [self dm_imageWithUrlLight:lightUrl dark:darkUrl completion:completion];
}

+ (void)dm_imageWithUrlLight:(NSURL *)light dark:(NSURL *)dark completion:(void (^)(UIImage * _Nullable, NSError * _Nullable))completion {
    SDWebImageManager *manager = SDWebImageManager.sharedManager;
    __block BOOL darkFinish = false;
    __block BOOL lightFinish = false;
    __block UIImage *lightImage;
    __block UIImage *darkImage;
    __block NSError *theError;
    void(^finishBlock)(void) = ^() {
        if (!lightFinish || !darkFinish) {
            return;
        }
        if (theError) {
            completion(nil, theError);
            return;
        }
        if (lightImage) {
            UIImage *image = [UIImage dm_imageWithImageLight:lightImage dark:darkImage];
            completion(image, nil);
            return;
        }
        NSError *noImageError = [NSError errorWithDomain:@"com.EasyInterface.download" code:0 userInfo:@{
                                                                                          @"message": @"Download is success but we find no image available."
                                                                                          }];
        completion(nil, noImageError);
    };
    finishBlock = [finishBlock copy];
    [manager loadImageWithURL:light options:SDWebImageRetryFailed progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
        lightImage = image;
        if (!theError) {
            theError = error;
        }
        lightFinish = true;
        finishBlock();
    }];
    [manager loadImageWithURL:dark options:SDWebImageRetryFailed progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
        darkImage = image;
        if (!theError) {
            theError = error;
        }
        darkFinish = true;
        finishBlock();
    }];
}

@end
