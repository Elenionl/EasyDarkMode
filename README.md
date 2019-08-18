# EasyDarkMode

## Introduction

This is a tool for developers to easily adapt dark mode in iOS 13.

[](https://raw.githubusercontent.com/Elenionl/EasyDarkMode/master/Sample/demo.mov?token=AD5OKW6SDH6NR7ZNXDIYRDK5MKS7U)

[](https://github.com/Elenionl/EasyDarkMode/blob/master/Sample/image_light.png?raw=true)

[](https://github.com/Elenionl/EasyDarkMode/blob/master/Sample/image_dark.png?raw=true)

## Features

* Shortcut method to create UIColor with different user interface type (dark mode).

* Shortcut method to create UIImage with different user interface type (dark mode).

* Shortcut method to download remoate image with SDWebImage and create UIImage with different user interface type (dark mode).

## How to install

### Using `CocoaPods`

* If you want to create local image and color with different user interface type. Just write as bellow in podfile.

``` Ruby
pod 'EasyDarkMode'
```

* If you want additional functions to create image object with remote images by using SDWebImage. Try this pod:

``` Ruby
pod 'EasyDarkMode/SDWebImage'
```

## How to use

### Create static color

``` ObjC
@interface UIColor (DM)

  + (UIColor *)dm_colorWithColorLight:(UIColor *)light dark:(nullable UIColor *)dark;

@end
```

### Create image with local light and dark image

``` ObjC
@interface UIImage (DM)

  + (UIImage *)dm_imageWithImageLight:(UIImage *)light dark:(nullable UIImage *)dark;

  + (UIImage *)dm_imageWithNameLight:(NSString *)light dark:(nullable NSString *)dark;

@end
```

### Create image object with remote images

❗️**Do use EasyDarkMode/SDWebImage**

``` Objc
@interface UIImage (DMSD)

  + (void)dm_imageWithUrlLight:(NSURL *)light dark:(NSURL * _Nullable)dark completion:(void(^)(UIImage * _Nullable image, NSError * _Nullable error))completion;

  + (void)dm_imageWithPathStringLight:(NSString *)light dark:(NSString * _Nullable)dark completion:(void(^)(UIImage * _Nullable image, NSError * _Nullable error))completion;

@end
```

There are functins similar with SDWebImage

``` ObjC

@interface UIButton (DMSD)

  - (void)dm_setImageUrlLight:(nullable NSURL *)light dark:(nullable NSURL *)dark forState:(UIControlState)state;

  - (void)dm_setImageStringLight:(nullable NSString *)light dark:(nullable NSString *)dark forState:(UIControlState)state;

  - (void)dm_setBackgroundUrlLight:(nullable NSURL *)light dark:(nullable NSURL *)dark forState:(UIControlState)state;

  - (void)dm_setBackgroundStringLight:(nullable NSString *)light dark:(nullable NSString *)dark forState:(UIControlState)state;

@end

@interface UIImageView (DMSD)

  - (void)dm_setImageUrlLight:(nullable NSURL *)light dark:(nullable NSURL *)dark;

  - (void)dm_setImageStringLight:(nullable NSString *)light dark:(nullable NSString *)dark;

@end

```
