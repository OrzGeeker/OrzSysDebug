Pod::Spec.new do |s|
  s.name         = "OrzSysDebug"
  s.version      = "0.0.1"
  s.summary      = "A tool to enable UIDebuggingInformationOverlay for iOS 10 & 11 & 12."
  s.description  = <<-DESC
  A tool to enable UIDebuggingInformationOverlay for iOS 10 & 11 & 12. With This tool,
  you can make your development fly as apple developer.
                   DESC
  s.homepage     = "https://github.com/OrzGeeker/OrzSysDebug.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "wangzhizhou" => "824219521@qq.com" }
  s.social_media_url   = "https://github.com/wangzhizhou"
  s.platform     = :ios
  s.source       = { :git => "https://github.com/OrzGeeker/OrzSysDebug.git", :tag => "#{s.version}" }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.public_header_files = "Classes/OrzSysDebug.h"
  s.framework  = "UIKit"
  s.requires_arc = true

end
