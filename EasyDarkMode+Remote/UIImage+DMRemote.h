//
//  UIImage+DMRemote.h
//  EasyDarkMode
//
//  Created by Elenion on 2019/8/21.
//  Copyright © 2019 Elenion. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (DMRemote)

+ (void)dm_imageWithUrlLight:(NSURL *)light dark:(NSURL *)dark completion:(void(^)(UIImage * _Nullable image, NSError * _Nullable error))completion;

+ (void)dm_imageWithPathStringLight:(NSString *)light dark:(NSString *)dark completion:(void(^)(UIImage * _Nullable image, NSError * _Nullable error))completion;

@end

NS_ASSUME_NONNULL_END
