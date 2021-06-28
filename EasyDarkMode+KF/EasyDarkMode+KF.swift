//
//  EasyDarkMode+KF.swift
//  EasyDarkMode
//
//  Created by Elenion on 2019/8/21.
//  Copyright © 2019 Elenion. All rights reserved.
//

import UIKit
import Kingfisher

public extension DMDownloadManager {
    func connectWithKingfisher() {
        let manageDownloader = KingfisherManager.shared.downloader
        downloader = { (url, completion) in
            manageDownloader.downloadImage(with: url, options: nil) { result in
                switch result {
                case .success(let successResult):
                    completion(successResult.image, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
        }
    }
}
