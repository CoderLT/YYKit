Pod::Spec.new do |s|
  s.name         = 'YYKit_NoImage'
  s.summary      = 'A collection of iOS components.'
  s.version      = '1.0.9'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'ibireme' => 'ibireme@gmail.com' }
  s.social_media_url = 'http://blog.ibireme.com'
  s.homepage     = 'https://github.com/ibireme/YYKit'
  s.platform     = :ios, '6.0'
  s.ios.deployment_target = '6.0'
  s.source       = { :git => 'https://github.com/ibireme/YYKit.git', :tag => s.version.to_s }
  
  s.requires_arc = true
  s.source_files = 'YYKit/**/*.{h,m}'
  s.public_header_files = 'YYKit/**/*.{h}'

  s.ios.exclude_files = 'YYKit/Base/Foundation/NSObject+YYAddForARC.{h,m}', 'YYKit/Base/Foundation/NSThread+YYAdd.{h,m}', 'YYSpriteSheetImage.m','YYSpriteSheetImage.h','YYImageCoder.m','YYImageCoder.h','YYImage.m','YYImage.h','YYFrameImage.m','YYFrameImage.h','YYAnimatedImageView.m','YYAnimatedImageView.h'
  s.subspec 'no-arc' do |sna|
    sna.requires_arc = false
    sna.source_files = 'YYKit/Base/Foundation/NSObject+YYAddForARC.{h,m}', 'YYKit/Base/Foundation/NSThread+YYAdd.{h,m}'
  end

  s.libraries = 'z', 'sqlite3'
  s.frameworks = 'UIKit', 'CoreFoundation', 'CoreText', 'CoreGraphics', 'CoreImage', 'QuartzCore', 'ImageIO', 'AssetsLibrary', 'Accelerate', 'MobileCoreServices', 'SystemConfiguration'
  s.ios.vendored_frameworks = 'Vendor/WebP.framework'

end