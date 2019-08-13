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
        scrollView.addSubview(easyDarkModeAttachmentLabel)
        scrollView.addSubview(easyDarkModeAttachment)
        easyDarkModeAttachmentLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(easyDarkModeColor.snp.bottom).offset(10)
            make.height.equalTo(25)
        }
        easyDarkModeAttachment.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(easyDarkModeAttachmentLabel.snp.bottom).offset(10)
            make.height.equalTo(25)
            make.width.equalTo(200)
        }
        scrollView.addSubview(divider)
        divider.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(easyDarkModeAttachment.snp.bottom).offset(10)
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
        }
        scrollView.addSubview(easySdImageAttachmentLabel)
        scrollView.addSubview(easySdImageAttachment)
        easySdImageAttachmentLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(easySdImageButton.snp.bottom).offset(10)
            make.height.equalTo(25)
        }
        easySdImageAttachment.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(easySdImageAttachmentLabel.snp.bottom).offset(10)
            make.height.equalTo(25)
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
    
    lazy var easyDarkModeImage: UIImageView = {
        let item = UIImageView()
        item.image = UIImage.dm_image(withNameLight: "check_light", dark: "check_dark")
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
        item.backgroundColor = UIColor.dm_color(withColorLight: UIColor.black, dark: UIColor.white)
        item.text = "This label's color can change with trait."
        item.textColor = UIColor.dm_color(withColorLight: UIColor.white, dark: UIColor.black)
        return item
    }()
    
    lazy var easyDarkModeAttachmentLabel: UILabel = {
        let item = UILabel()
        item.text = "Easy dark mode attachment."
        item.textAlignment = .center
        return item
    }()
    
    lazy var easyDarkModeAttachment: UILabel = {
        let item = UILabel()
        let attributedString = NSMutableAttributedString(string: "This image can change:")
        let attachment = NSTextAttachment.dm_textAttachment(withImageNameLight: "check_light", dark: "check_dark")
        attachment.dm_update(with: UIFont.systemFont(ofSize: 14))
        let imageString = NSAttributedString(attachment: attachment)
        attributedString.append(imageString)
        item.attributedText = attributedString
        return item
    }()
    
    lazy var divider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.dm_color(withColorLight: UIColor.gray, dark: UIColor.lightGray)
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
        UIImage.dm_image(withPathStringLight: "http://img.mp.itc.cn/upload/20160525/73e975795bf94f82baf43315f89a30b1_th.jpg", dark: "http://img.mp.itc.cn/upload/20160525/5d6588b3c928495a9ee0eb2b0b672936_th.jpg") { (image, error) in
            item.image = image
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
        item.dm_setImageStringLight("http://img.mp.itc.cn/upload/20160525/73e975795bf94f82baf43315f89a30b1_th.jpg", dark: "http://img.mp.itc.cn/upload/20160525/5d6588b3c928495a9ee0eb2b0b672936_th.jpg")
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
        item.dm_setBackgroundStringLight("http://img.mp.itc.cn/upload/20160525/73e975795bf94f82baf43315f89a30b1_th.jpg", dark: "http://img.mp.itc.cn/upload/20160525/5d6588b3c928495a9ee0eb2b0b672936_th.jpg", for: UIControl.State.normal)
        return item
    }()
    
    lazy var easySdImageAttachmentLabel: UILabel = {
        let item = UILabel()
        item.text = "Image in NSAttributedString with SDWebImage."
        item.textAlignment = .center
        return item
    }()
    
    lazy var easySdImageAttachment: UIView = {
        let item = UILabel()
        let attachment = NSTextAttachment.dm_attachment(withStringLight: "http://img.mp.itc.cn/upload/20160525/73e975795bf94f82baf43315f89a30b1_th.jpg", dark: "http://img.mp.itc.cn/upload/20160525/5d6588b3c928495a9ee0eb2b0b672936_th.jpg")
        attachment.dm_update(with: UIFont.systemFont(ofSize: 14))
        let string = NSAttributedString(attachment: attachment)
        item.dm_setAttributedText(string)
        return item
    }()
}

