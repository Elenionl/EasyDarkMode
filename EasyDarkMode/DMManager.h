//
//  DMManager.h
//  EasyDarkMode
//
//  Created by Elenion on 2020/4/21.
//  Copyright © 2020 Elenion. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, DMUserInterfaceStyle) {
    DMUserInterfaceStyleUnspecified,
    DMUserInterfaceStyleLight,
    DMUserInterfaceStyleDark,
};

@interface DMManager : NSObject

/// UIImage and UIColor objects do not contain different appearance for ingerface styles when application is running on iOS 12 or lower. You can specify which appearance you prefer on iOS 12 or lower.
/// Attention, call this function as soon as possible, if you want to change appearence. Otherwise, this will lead to odd appearence problems.
/// Attention, in this circumstance, DMUserInterfaceStyleUnspecified is equal to DMUserInterfaceStyleLight.
@property (nonatomic, assign) DMUserInterfaceStyle interfaceStyleForLowerSystem;

@property (class, readonly) DMManager *shared;

@end

NS_ASSUME_NONNULL_END
