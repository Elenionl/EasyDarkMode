# EasyDarkMode

![version](https://img.shields.io/cocoapods/v/EasyDarkMode)
![license](https://img.shields.io/github/license/Elenionl/EasyDarkMode)
![platform](https://img.shields.io/cocoapods/p/EasyDarkMode)



## Introduction

iOS 13 introduces two kinds of user interface types, light and dark.

This is a tool for developers to easily adapt interface feature in iOS 13.

[中文版本](https://zhuanlan.zhihu.com/p/78728387)



## Quick start

### Using only local images and colors:

``` Ruby
pod 'EasyDarkMode'
```

``` Swift
import EasyDarkMode

view.backgroundColor = UIColor.dm.color(color: , dark: UIColor.white)
imageView.image = UIImage.dm.image(name: "check_light", dark: "check_dark")
```

``` Objective-C
#import <EasyDarkMode/EasyDarkMode.h>

view.backgroundColor = [UIColor dm_colorWithColorLight:UIColor.grayColor dark:UIColor.whiteColor];
imageView.image = [UIImage dm_imageWithNameLight:@"check_light" dark:@""check_dark""];
```



### Using local images and colors along with remote images downloaded by SDWebimage:

``` Ruby
pod 'EasyDarkMode/SDWebImage'
```

``` Swift
import EasyDarkMode
// You should config downloder once using connectWithSdWebImage function before start to download images.
DMDownloadManager.shared.connectWithSdWebImage()
item.dm.setImage(pathString: "http://img.mp.itc.cn/upload/20160525/73e975795bf94f82baf43315f89a30b1_th.jpg", dark: "http://img.mp.itc.cn/upload/20160525/5d6588b3c928495a9ee0eb2b0b672936_th.jpg", for: UIControl.State.normal)
```

``` Objective-C
#import <EasyDarkMode/EasyDrakMode.h>
// You should config downloder once using connectWithSdWebImage function before start to download images.
[DMDownloadManager.shared connectWithSdWebImage];
[button dm_setImagePathStringLight:@"http://img.mp.itc.cn/upload/20160525/73e975795bf94f82baf43315f89a30b1_th.jpg" dark:@"http://img.mp.itc.cn/upload/20160525/5d6588b3c928495a9ee0eb2b0b672936_th.jpg" forState:UIControlStateNnormal];
```



### Using local images and colors along with remote images downloaded by Kingfiser:

``` Ruby
pod 'EasyDarkMode/Kingfisher'
```

``` Swift
import EasyDarkMode
// You should config downloder once using connectWithSdWebImage function before start to download images.
DMDownloadManager.shared.connectWithKingfisher()
item.dm.setImage(pathString: "http://img.mp.itc.cn/upload/20160525/73e975795bf94f82baf43315f89a30b1_th.jpg", dark: "http://img.mp.itc.cn/upload/20160525/5d6588b3c928495a9ee0eb2b0b672936_th.jpg", for: UIControl.State.normal)
```

## Samples

![video](https://raw.githubusercontent.com/Elenionl/EasyDarkMode/master/Sample/demo.mov?token=AD5OKW6SDH6NR7ZNXDIYRDK5MKS7U)

![light](https://github.com/Elenionl/EasyDarkMode/blob/master/Sample/image_light.png?raw=true)

![dark](https://github.com/Elenionl/EasyDarkMode/blob/master/Sample/image_dark.png?raw=true)



## Features

* Shortcut method to create UIColor with different user interface type.

* Shortcut method to create UIImage with different user interface type.

* Written in Objective-C. All functions available in Swift with modern APIs.

* Shortcut method to download remoate image with SDWebImage and Kingfisher and create UIImage with different user interface type.

* This code can work on from Xcode 9 to Xcode 11.

* It has an various deployment target version from iOS 8 to iOS 13.



## Custom Guide

### Using only `local images`. Using `Objective-C`

``` Ruby
pod 'EasyDarkMode'
```

or

``` Ruby
pod 'EasyDarkMode/Core'
```

### Using only `local images`. Using `Swift`

``` Ruby
pod 'EasyDarkMode/Core-Swift'
```

### Using both `local images` and `remote images`. I prefer to download with `SDWebImage`. Using `Objective-C`

``` Ruby
pod 'EasyDarkMode/SDWebImage'
```

### Using both `local images` and `remote images`. I prefer to download with `SDWebImage`. Using `Swift`

``` Ruby
pod 'EasyDarkMode/SDWebImage+Swift'
```

### Using both `local images` and `remote images`. I prefer to download with `Kingfisher`. Using `Swift`

``` Ruby
pod 'EasyDarkMode/Kingfisher'
```

### Using both `local images` and `remote images`. I prefer to offer download function `by myself`. Using `Objective-C`

``` Ruby
pod 'EasyDarkMode/Remote'
```

### Using both `local images` and `remote images`. I prefer to offer download function `by myself`. Using `Swift`

``` Ruby
pod 'EasyDarkMode/Remote-Swift'
```



## APIs

### Create static color

* Available in `EasyDarkMode/Core`

``` ObjC
@interface UIColor (DM)

  + (UIColor *)dm_colorWithColorLight:(UIColor *)light dark:(nullable UIColor *)dark;

@end
```

#### Create image with local light and dark image

* Available in `EasyDarkMode/Core`

``` ObjC
@interface UIImage (DM)

  + (UIImage *)dm_imageWithImageLight:(UIImage *)light dark:(nullable UIImage *)dark;

  + (UIImage *)dm_imageWithNameLight:(NSString *)light dark:(nullable NSString *)dark;

@end
```

### Create UIImage object with remote images

* Available in `EasyDarkMode/Remote`

#### Register downloader

***Very Important*** If your are using `EasyDarkMode/SDWebImage`, `EasyDarkMode/Kingfisher` o `EasyDarkMode/Remote`, it is very important that you should register a downloader before you call functions.

* If you are using `EasyDarkMode/SDWebImage`, you should call function below at startup of the application.

``` Objc
[DMDownloadManager.shared connectWithSdWebImage];
```

or

``` Swift
DMDownloadManager.shared.connectWithSdWebImage()
```

* If you are using `EasyDarkMode/Kingfisher`, you should call function below at startup of the application.

``` Swift
DMDownloadManager.shared.connectWithKingfisher()
```

* If you are using `EasyDarkMode/Remote`, you should call function below at startup of the application.

``` Swift
DMDownloadManager.shared.downloader = { (url, completion) in
  // ...
}
```

#### Functions

``` Objc
@interface UIImage (DMSD)

  + (void)dmsd_imageWithUrlLight:(NSURL *)light dark:(NSURL * _Nullable)dark completion:(void(^)(UIImage * _Nullable image, NSError * _Nullable error))completion;

  + (void)dmsd_imageWithPathStringLight:(NSString *)light dark:(NSString * _Nullable)dark completion:(void(^)(UIImage * _Nullable image, NSError * _Nullable error))completion;

@end
```

``` ObjC

@interface UIButton (DMSD)

  - (void)dmsd_setImageUrlLight:(nullable NSURL *)light dark:(nullable NSURL *)dark forState:(UIControlState)state;

  - (void)dmsd_setImageStringLight:(nullable NSString *)light dark:(nullable NSString *)dark forState:(UIControlState)state;

  - (void)dmsd_setBackgroundUrlLight:(nullable NSURL *)light dark:(nullable NSURL *)dark forState:(UIControlState)state;

  - (void)dmsd_setBackgroundStringLight:(nullable NSString *)light dark:(nullable NSString *)dark forState:(UIControlState)state;

@end

@interface UIImageView (DMSD)

  - (void)dmsd_setImageUrlLight:(nullable NSURL *)light dark:(nullable NSURL *)dark;

  - (void)dmsd_setImageStringLight:(nullable NSString *)light dark:(nullable NSString *)dark;

@end

```



## TODO

🍤 Support UIImage/UIColor

🥐 Support SDWebImage

🍩 Support KingFisher.

Find a way to support NSTextAttachment in NSAttributedString.

Find a way to support web image for NSTextAttachment.
