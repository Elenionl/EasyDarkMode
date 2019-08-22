//
//  DMDownloadManager.h
//  EasyDarkMode
//
//  Created by Elenion on 2019/8/21.
//  Copyright © 2019 Elenion. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^DMDownloadHandler)( UIImage * __nullable image, NSError * __nullable error);

typedef void(^DMDownloader)(NSURL *url, DMDownloadHandler completion);

@interface DMDownloadManager : NSObject

@property (class, readonly) DMDownloadManager *shared;

@property (nonatomic, copy, nullable) DMDownloader downloader;

@end

NS_ASSUME_NONNULL_END
