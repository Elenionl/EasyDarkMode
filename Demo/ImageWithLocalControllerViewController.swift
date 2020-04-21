//
//  ImageWithLocalControllerViewController.swift
//  Demo
//
//  Created by Elenion on 2020/3/11.
//  Copyright © 2020 Elenion. All rights reserved.
//

import UIKit

class ImageWithLocalControllerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.dm_color(withColorLight: UIColor.white, dark: UIColor.black)
        view.addSubview(easyDarkModeImage)
        easyDarkModeImage.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        easyDarkModeImage.center = view.center;
    }
    
    lazy var easyDarkModeImage: UIImageView = {
        let item = UIImageView()
        item.image = UIImage.dm.imageName(light: "check_light", dark: "check_dark")
        return item
    }()

}
