#
#  Be sure to run `pod spec lint YHRegion.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "YHRegion"
  s.version      = "0.0.5"
  s.summary      = "地区相关"
  s.description  = <<-DESC
  提供地区管理 和 显示
                   DESC
  s.platform     = :ios, "8.0"
  s.ios.deployment_target = "8.0"

  s.homepage     = "http://git.solot.co:10080/liao/YHRegion.git"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "李傲" => "liao@solot.com" }
  s.source       = { :git => "http://git.solot.co:10080/liao/YHRegion.git", :tag => "0.0.5" }
 s.source_files  = "Classes", "Classes/**/*.{h,m}"
  # s.source_files  = "YHRegionManager/*.{h,m}"
s.public_header_files = "Classes/**/*.h"    
 s.exclude_files = "Classes/Exclude"
  # s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"
# s.resources = "YHRegionManager/regionDb.bundle"
 s.resources = "Resources/regionDb.bundle"

s.dependency "HQDBDecode"
s.dependency "YHLanguageSetting"

end
