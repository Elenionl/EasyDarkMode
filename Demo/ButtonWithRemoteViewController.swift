//
//  ButtonWithRemoteViewController.swift
//  Demo
//
//  Created by Elenion on 2020/3/11.
//  Copyright © 2020 Elenion. All rights reserved.
//

import UIKit

class ButtonWithRemoteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.dm_color(withColorLight: UIColor.white, dark: UIColor.black)
        view.addSubview(easySdImageButton)
        easySdImageButton.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        easySdImageButton.center = view.center;
    }
    
    lazy var easySdImageButton: UIView = {
        let item = UIButton()
        item.dm.setImagePathString(light: "http://img.mp.itc.cn/upload/20160525/73e975795bf94f82baf43315f89a30b1_th.jpg", dark: "http://img.mp.itc.cn/upload/20160525/5d6588b3c928495a9ee0eb2b0b672936_th.jpg", for: UIControl.State.normal)
        return item
    }()

}
