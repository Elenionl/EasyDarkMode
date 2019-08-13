//
//  UIImage+DMSD.h
//  EasyInterface
//
//  Created by 徐汉平 on 2019/8/10.
//  Copyright © 2019 Elenion. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (DMSD)

+ (void)dm_imageWithUrlLight:(NSURL *)light dark:(NSURL * _Nullable)dark completion:(void(^)(UIImage * _Nullable image, NSError * _Nullable error))completion;

+ (void)dm_imageWithPathStringLight:(NSString *)light dark:(NSString * _Nullable)dark completion:(void(^)(UIImage * _Nullable image, NSError * _Nullable error))completion;

@end

NS_ASSUME_NONNULL_END
