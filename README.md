# EasyDarkMode

![version](https://img.shields.io/cocoapods/v/EasyDarkMode)
![license](https://img.shields.io/github/license/Elenionl/EasyDarkMode)
![platform](https://img.shields.io/cocoapods/p/EasyDarkMode)
![Swfit](https://img.shields.io/badge/Swfit-●-orange)
![Objective-C](https://img.shields.io/badge/Objective--C-●-blue)

## Introduction

iOS 13 introduces user interface feature. This feature contains two kinds of user interface types, light and dark.

This project is a tool for developers to easily adapt user interface feature in iOS 13.

## **Star** if you like it.

## Samples

![video](https://raw.githubusercontent.com/Elenionl/EasyDarkMode/master/Sample/demo.mov?token=AD5OKW6SDH6NR7ZNXDIYRDK5MKS7U)

![light](https://github.com/Elenionl/EasyDarkMode/blob/master/Sample/image_light.png?raw=true)

![dark](https://github.com/Elenionl/EasyDarkMode/blob/master/Sample/image_dark.png?raw=true)

## Integrate with [Cocoapods](https://cocoapods.org)

Use this firm to find `podfile` script for your project.

Firstly, choose according to the language used in your project (`Swift`/`Objective-C`).

Secondly, choose according to whether you are using network image  (`Local image`/Others).

Then, if you are using network image, choose the download method you preferred (`SDWebImage`/`Kingfisher`/`Custom download method`).

|Podfile script | Objective-C | Swift | Local image | SDWebImage | Kingfisher | Custom download |
| --- | --- | --- | --- | --- | --- | --- |
 `pod 'EasyDarkMode'` or `pod 'EasyDarkMode/Core'` | ● | ○ | ● | ○ | ○ | ○ |
| `pod 'EasyDarkMode/Core-Swift'` | ○ | ● | ● | ○ | ○ | ○ |
| `pod 'EasyDarkMode/SDWebImage'` | ● | ○ | ● | ● | ○ | ○ |
| `pod 'EasyDarkMode/SDWebImage+Swift'` | ○ | ● | ● | ● | ○ | ○ |
| `pod 'EasyDarkMode/Kingfisher'` | ○ | ● | ● | ○ | ● | ○ |
| `pod 'EasyDarkMode/Remote'` | ● | ○ | ● | ○ | ○ | ● |
| `pod 'EasyDarkMode/Remote-Swift'` | ○ | ● | ● | ○ | ○ | ● |

## How to use

### Create color with different user interface

* Swift

Included in pod `'EasyDarkMode/Core-Swift'`

``` Swift
import EasyDarkMode

view.backgroundColor = UIColor.dm.color(white:UIColor.black , dark: UIColor.white)
```

* Objective-C

Included in pod `'EasyDarkMode/Core'`

``` Objective-C
#import <EasyDarkMode/EasyDarkMode.h>

view.backgroundColor = [UIColor dm_colorWithColorLight:UIColor.grayColor dark:UIColor.whiteColor];
```

### Create image from local with different user interface

* Swift

Included in pod `'EasyDarkMode/Core-Swift'`

``` Swift
import EasyDarkMode

imageView.image = UIImage.dm.image(name: "check_light", dark: "check_dark")
```

* Objective-C

Included in pod `'EasyDarkMode/Core'`

``` Objective-C
#import <EasyDarkMode/EasyDarkMode.h>

imageView.image = [UIImage dm_imageWithNameLight:@"check_light" dark:@""check_dark""];
```

### Create image from SDWebImage with different user interface

* Swift

Included in pod `'EasyDarkMode/SDWebImage+Swift'`

``` Swift
import EasyDarkMode
// You should config downloder once before start to download images.
DMDownloadManager.shared.connectWithSdWebImage()
// ...
item.dm.setImage(pathString: "http://img.mp.itc.cn/upload/20160525/73e975795bf94f82baf43315f89a30b1_th.jpg", dark: "http://img.mp.itc.cn/upload/20160525/5d6588b3c928495a9ee0eb2b0b672936_th.jpg", for: UIControl.State.normal)
```

* Objective-C

Included in pod `'EasyDarkMode/SDWebImage'`

``` Objective-C
#import <EasyDarkMode/EasyDrakMode.h>
// You should config downloder once before start to download images.
[DMDownloadManager.shared connectWithSdWebImage];
// ...
[button dm_setImagePathStringLight:@"http://img.mp.itc.cn/upload/20160525/73e975795bf94f82baf43315f89a30b1_th.jpg" dark:@"http://img.mp.itc.cn/upload/20160525/5d6588b3c928495a9ee0eb2b0b672936_th.jpg" forState:UIControlStateNnormal];
```

### Create image from Kingfisher with different user interface

* Swift

Included in pod `'EasyDarkMode/Kingfisher'`

``` Swift
import EasyDarkMode
// You should config downloder once before start to download images.
DMDownloadManager.shared.connectWithKingfisher()
// ...
item.dm.setImage(pathString: "http://img.mp.itc.cn/upload/20160525/73e975795bf94f82baf43315f89a30b1_th.jpg", dark: "http://img.mp.itc.cn/upload/20160525/5d6588b3c928495a9ee0eb2b0b672936_th.jpg", for: UIControl.State.normal)
```

### Create image from custom download method with different user interface

* Swift

Included in pod `'EasyDarkMode/Remote-Swift'`

``` Swift
import EasyDarkMode
// You should config downloder once before start to download images.
DMDownloadManager.shared.downloader = { (url, completion) in
    // ...
}
// ...
item.dm.setImage(pathString: "http://img.mp.itc.cn/upload/20160525/73e975795bf94f82baf43315f89a30b1_th.jpg", dark: "http://img.mp.itc.cn/upload/20160525/5d6588b3c928495a9ee0eb2b0b672936_th.jpg", for: UIControl.State.normal)
```

* Objective-C

Included in pod `'EasyDarkMode/Remote'`

``` Objective-C
#import <EasyDarkMode/EasyDrakMode.h>
// You should config downloder once before start to download images.
DMDownloadManager.shared.downloader = ^(NSURL * _Nonnull data, DMDownloadHandler  _Nonnull completion) {
    // ...
}
// ...
[button dm_setImagePathStringLight:@"http://img.mp.itc.cn/upload/20160525/73e975795bf94f82baf43315f89a30b1_th.jpg" dark:@"http://img.mp.itc.cn/upload/20160525/5d6588b3c928495a9ee0eb2b0b672936_th.jpg" forState:UIControlStateNnormal];
```

## Features

* Shortcut method to create UIColor with different user interface type.

* Shortcut method to create UIImage with different user interface type.

* Written in Objective-C. All functions available in Swift with modern APIs.

* Shortcut method to download remoate image with SDWebImage and Kingfisher and create UIImage with different user interface type.

* This code can work on from Xcode 9 to Xcode 11.

* It has an various deployment target version from iOS 8 to iOS 13.

* We found that enable appearence image set in `xcassets` leads to dramatic lagging in application startup. Some walkaround like combine images into one `UIImage` object manually is necessory, if you are working with a giant application.

## TODO

[●] Support UIImage/UIColor

[●] Support SDWebImage

[●] Support KingFisher.

[○] Find a way to support NSTextAttachment in NSAttributedString.

[○] Find a way to support web image for NSTextAttachment.
