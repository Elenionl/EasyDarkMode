#
#  Be sure to run `pod spec lint EasyDarkMode.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "EasyDarkMode"
  s.version      = "0.0.3"
  s.summary      = "This is a tool for developers to easily adapt dark mode in iOS 13."

  s.description  = <<-DESC
  * Shortcut method to create UIColor with different user interface type (dark mode).

  * Shortcut method to create UIImage with different user interface type (dark mode).

  * Shortcut method to download remoate image with SDWebImage and create UIImage with different user interface type (dark mode).
  
  * This code can work on from Xcode 9 to Xcode 11.

  * It has an various deployment target version from iOS 8 to iOS 13.
                   DESC

  s.homepage     = "https://github.com/Elenionl/EasyDarkMode"
  s.screenshots  = "https://github.com/Elenionl/EasyDarkMode/raw/master/Sample/image_light.png?raw=true", "https://github.com/Elenionl/EasyDarkMode/raw/master/Sample/image_dark.png?raw=true"

  s.license      = "MIT"

  s.author             = { "Elenion" => "stellanxu@gmail.com" }
  s.social_media_url   = "https://github.com/Elenionl"

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/Elenionl/EasyDarkMode.git", :tag => "#{s.version}" }

  s.subspec 'Core' do |ss|
    ss.source_files  = "EasyDarkMode"
  end

  s.subspec 'SDWebImage' do |ss|
    ss.source_files = "EasyDarkMode+SD"
    ss.dependency 'EasyDarkMode/Core'
    ss.dependency 'SDWebImage'
  end

  s.default_subspec = 'Core'

end
