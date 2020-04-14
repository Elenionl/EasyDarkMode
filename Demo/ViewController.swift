//
//  ViewController.swift
//  Demo
//
//  Created by Elenion on 2019/8/12.
//  Copyright © 2019 Elenion. All rights reserved.
//

import UIKit.DocumentManager
import EasyDarkMode
import SnapKit
import EasyDarkMode

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.dm_color(withColorLight: UIColor.white, dark: UIColor.black)
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        scrollView.addSubview(systemImpLabel)
        scrollView.addSubview(systemImpl)
        systemImpLabel.snp.makeConstraints { (make) in
            make.width.equalTo(view.snp.width)
            make.left.right.equalToSuperview()
            make.top.equalTo(44)
            make.height.equalTo(25)
        }
        systemImpl.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(systemImpLabel.snp.bottom).offset(10)
            make.width.height.equalTo(25)
        }
        scrollView.addSubview(easyDarkModeImageLabel)
        scrollView.addSubview(easyDarkModeImage)
        scrollView.addSubview(easyDarkModeSecondImage)
        easyDarkModeImageLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(systemImpl.snp.bottom).offset(10)
            make.height.equalTo(25)
        }
        easyDarkModeImage.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(easyDarkModeImageLabel.snp.bottom).offset(10)
            make.width.height.equalTo(25)
        }
        easyDarkModeSecondImage.snp.makeConstraints { (make) in
            make.left.equalTo(easyDarkModeImage.snp.right).offset(10)
            make.top.equalTo(easyDarkModeImageLabel.snp.bottom).offset(10)
            make.width.height.equalTo(25)
        }
        scrollView.addSubview(easyDarkModeColorLabel)
        scrollView.addSubview(easyDarkModeColor)
        easyDarkModeColorLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(easyDarkModeImage.snp.bottom).offset(10)
            make.height.equalTo(25)
        }
        easyDarkModeColor.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(easyDarkModeColorLabel.snp.bottom).offset(10)
            make.height.equalTo(25)
        }
        scrollView.addSubview(divider)
        divider.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(easyDarkModeColor.snp.bottom).offset(10)
            make.height.equalTo(2)
        }
        scrollView.addSubview(easySdImageLabel)
        scrollView.addSubview(easySdImage)
        easySdImageLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(divider.snp.bottom).offset(10)
            make.height.equalTo(25)
        }
        easySdImage.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(easySdImageLabel.snp.bottom).offset(10)
            make.height.equalTo(130)
            make.width.equalTo(200)
        }
        scrollView.addSubview(easySdImageViewLabel)
        scrollView.addSubview(easySdImageView)
        easySdImageViewLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(easySdImage.snp.bottom).offset(10)
            make.height.equalTo(25)
        }
        easySdImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(easySdImageViewLabel.snp.bottom).offset(10)
            make.height.equalTo(130)
            make.width.equalTo(200)
        }
        scrollView.addSubview(easySdImageButtonLabel)
        scrollView.addSubview(easySdImageButton)
        easySdImageButtonLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(easySdImageView.snp.bottom).offset(10)
            make.height.equalTo(25)
        }
        easySdImageButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(easySdImageButtonLabel.snp.bottom).offset(10)
            make.height.equalTo(130)
            make.width.equalTo(200)
            make.bottom.equalToSuperview().offset(-50)
        }
    }
    
    lazy var scrollView: UIScrollView = {
        let item = UIScrollView()
        return item
    }()

    lazy var systemImpLabel: UILabel = {
        let item = UILabel()
        item.text = "System implement with assets."
        item.textAlignment = .center
        return item
    }()
    
    lazy var systemImpl: UIImageView = {
        let item = UIImageView()
        item.image = UIImage.init(named: "check_universal")
        return item
    }()
    
    lazy var easyDarkModeImageLabel: UILabel = {
        let item = UILabel()
        item.text = "Easy dark mode image."
        item.textAlignment = .center
        return item
    }()
    
    lazy var easyDarkModeImage: UIView = {
        let item = UIButton()
//        item.image = UIImage.dm.image(name: "check_light", dark: "check_dark")
        let image = UIImage.dm.image(name: "check_light", dark: "check_dark")
        item.setImage(image, for: UIControl.State.normal)
        return item
    }()
    
    lazy var easyDarkModeSecondImage: UIView = {
            let item = UIImageView()
            item.image = UIImage.dm.image(name: "check_light-1", dark: "check_dark-1")
//            let image = UIImage.dm.image(name: "check_light-1", dark: "check_dark-1")
//            item.setImage(image, for: UIControl.State.normal)
            return item
        }()
    
    lazy var easyDarkModeColorLabel: UILabel = {
        let item = UILabel()
        item.text = "Easy dark mode color."
        item.textAlignment = .center
        return item
    }()
    
    lazy var easyDarkModeColor: UILabel = {
        let item = UILabel()
        item.backgroundColor = UIColor.dm.color(color: UIColor.black, dark: UIColor.white)
        item.text = "This label's color can change with trait."
        item.textColor = UIColor.dm.color(color: UIColor.white, dark: UIColor.black)
        return item
    }()
    
    lazy var divider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.dm.color(color: UIColor.gray, dark: UIColor.gray)
        return view
    }()
    
    lazy var easySdImageLabel: UILabel = {
        let item = UILabel()
        item.text = "Image with SDWebImage."
        item.textAlignment = .center
        return item
    }()
    
    lazy var easySdImage: UIView = {
        let item = UIImageView()
        UIImage.dm.image(pathString: "http://img.mp.itc.cn/upload/20160525/73e975795bf94f82baf43315f89a30b1_th.jpg", dark: "http://img.mp.itc.cn/upload/20160525/5d6588b3c928495a9ee0eb2b0b672936_th.jpg") { (result) in
            switch result {
            case .success(let image):
                item.image = image
            default:
                break
            }
        }
        return item
    }()
    
    lazy var easySdImageViewLabel: UILabel = {
        let item = UILabel()
        item.text = "Image in UIImageView with SDWebImage."
        item.textAlignment = .center
        return item
    }()
    
    lazy var easySdImageView: UIView = {
        let item = UIImageView()
        item.dm.setImage(stringPath: "http://img.mp.itc.cn/upload/20160525/73e975795bf94f82baf43315f89a30b1_th.jpg", dark: "http://img.mp.itc.cn/upload/20160525/5d6588b3c928495a9ee0eb2b0b672936_th.jpg")
        return item
    }()
    
    lazy var easySdImageButtonLabel: UILabel = {
        let item = UILabel()
        item.text = "Image in UIButton with SDWebImage."
        item.textAlignment = .center
        return item
    }()
    
    lazy var easySdImageButton: UIView = {
        let item = UIButton()
        item.dm.setImage(pathString: "http://img.mp.itc.cn/upload/20160525/73e975795bf94f82baf43315f89a30b1_th.jpg", dark: "http://img.mp.itc.cn/upload/20160525/5d6588b3c928495a9ee0eb2b0b672936_th.jpg", for: UIControl.State.normal)
        return item
    }()
}

