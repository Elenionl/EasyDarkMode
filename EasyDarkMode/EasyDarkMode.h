//
//  EasyDarkMode.h
//  EasyDarkMode
//
//  Created by Elenion on 2019/8/12.
//  Copyright © 2019 Elenion. All rights reserved.
//

#import <Foundation/Foundation.h>

//! Project version number for EasyDarkMode.
FOUNDATION_EXPORT double EasyDarkModeVersionNumber;

//! Project version string for EasyDarkMode.
FOUNDATION_EXPORT const unsigned char EasyDarkModeVersionString[];

#import <EasyDarkMode/UIColor+DM.h>
#import <EasyDarkMode/UIImage+DM.h>
#import <EasyDarkMode/DMManager.h>


#if __has_include(<EasyDarkMode/EasyDarkMode+Remote.h>)
#import <EasyDarkMode/EasyDarkMode+Remote.h>
#endif

#if __has_include(<EasyDarkMode/EasyDarkMode+SD.h>)
#import <EasyDarkMode/EasyDarkMode+SD.h>
#endif
