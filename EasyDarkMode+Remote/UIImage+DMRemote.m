//
//  UIImage+DMRemote.m
//  EasyDarkMode
//
//  Created by Elenion on 2019/8/21.
//  Copyright © 2019 Elenion. All rights reserved.
//

#import "UIImage+DMRemote.h"
#import "UIImage+DM.h"
#import "DMDownloadManager.h"

@implementation UIImage (DMRemote)

+ (void)dm_imageWithPathStringLight:(NSString *)light dark:(NSString *)dark completion:(void (^)(UIImage * _Nullable, NSError * _Nullable))completion {
    NSParameterAssert(light);
    NSURL *lightUrl = [NSURL URLWithString:light];
    NSURL *darkUrl = dark ? [NSURL URLWithString:dark] : nil;
    [self dm_imageWithUrlLight:lightUrl dark:darkUrl completion:completion];
}

+ (void)dm_imageWithUrlLight:(NSURL *)light dark:(NSURL *)dark completion:(void (^)(UIImage * _Nullable, NSError * _Nullable))completion {
    DMDownloadManager *manager = DMDownloadManager.shared;
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
        NSError *noImageError = [NSError errorWithDomain:@"com.EasyDarkMode.Remote" code:0 userInfo:@{
                                                                                          @"message": @"Download is success but no image available."
                                                                                          }];
        completion(nil, noImageError);
    };
    finishBlock = [finishBlock copy];
    if (!manager.downloader) {
        NSError *noManagerError = [NSError errorWithDomain:@"com.EasyDarkMode.Remote" code:1 userInfo:@{
            @"message": @"There is no download block available in downloadManager."
        }];
        completion(nil, noManagerError);
    }
    manager.downloader(light, ^(UIImage * _Nonnull image, NSError * _Nonnull error) {
        lightImage = image;
        if (!theError) {
            theError = error;
        }
        lightFinish = true;
        finishBlock();
    });
    manager.downloader(dark, ^(UIImage * _Nonnull image, NSError * _Nonnull error) {
        darkImage = image;
        if (!theError) {
            theError = error;
        }
        darkFinish = true;
        finishBlock();
    });
}

@end
