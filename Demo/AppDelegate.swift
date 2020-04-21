//
//  AppDelegate.swift
//  Demo
//
//  Created by Elenion on 2019/8/12.
//  Copyright © 2019 Elenion. All rights reserved.
//

import UIKit
import EasyDarkMode
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        DMDownloadManager.shared.connectWithKingfisher()
        
        // This line will change appearence in system iOS 12 or lower.
        DMManager.shared.interfaceStyleForLowerSystem = DMUserInterfaceStyle.dark
        
        //        DMDownloadManager.shared.connectWithSdWebImage()
        //        DMDownloadManager.shared.downloader = { (url, completion) in
                    // ...
        //        }
        let window = UIWindow()
        self.window = window
        window.rootViewController = ViewController()
        window.makeKeyAndVisible()
        return true
    }
    
}

