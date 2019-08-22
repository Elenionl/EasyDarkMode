//
//  EasyDarkMode+SD.m
//  EasyDarkMode
//
//  Created by Elenion on 2019/8/21.
//  Copyright © 2019 Elenion. All rights reserved.
//

#import "EasyDarkMode+SD.h"
#import <SDWebImage/SDWebImage.h>

@implementation DMDownloadManager (SD)

- (void)connectWithSdWebImage {
    SDWebImageManager *manager = SDWebImageManager.sharedManager;
    self.downloader = ^(NSURL * _Nonnull url, DMDownloadHandler  _Nonnull completion) {
        [manager loadImageWithURL:url options:SDWebImageAllowInvalidSSLCertificates progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
            completion(image, error);
        }];
    };
}

@end
